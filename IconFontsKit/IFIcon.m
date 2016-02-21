//
//  IFIcon.m
//  IconFontsKit
//
//  Created by Elf Sundae on 16/2/17.
//  Copyright © 2016年 www.0x123.com. All rights reserved.
//

#import "IFIcon.h"
#import <CoreText/CoreText.h>

@interface IFIcon ()
{
    IFIconType  _type;
    NSString *  _identifier;
}

@property (nonatomic, strong) NSMutableAttributedString *mutableAttributedString;
@end

@implementation IFIcon

- (instancetype)initWithCode:(NSString *)code fontSize:(CGFloat)fontSize
{
    self = [super init];
    if (self) {
        self.adjustsFontSizeWhileDrawing = YES;
        self.drawingPaddingMultiplie = [[self class] defaultDrawingPaddingMultiplie];
        self.mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:code attributes:@{NSFontAttributeName: [[self class] fontWithSize:fontSize]}];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    IFIcon *icon = [[[self class] allocWithZone:zone] init];
    icon.mutableAttributedString = [self.mutableAttributedString mutableCopy];
    icon->_type = self->_type;
    icon->_identifier = [self->_identifier copy];
    icon.drawingPositionAdjustment = self.drawingPositionAdjustment;
    icon.drawingPaddingMultiplie = self.drawingPaddingMultiplie;
    icon.drawingBackgroundColor = [self.drawingBackgroundColor copy];
    icon.adjustsFontSizeWhileDrawing = self.adjustsFontSizeWhileDrawing;
    return icon;
}

+ (instancetype)iconWithType:(IFIconType)type fontSize:(CGFloat)fontSize
{
    IFIcon *icon = [self iconWithCode:IFIconCodeForType(type) fontSize:fontSize];
    icon->_type = type;
    return icon;
}

+ (instancetype)iconWithType:(IFIconType)type fontSize:(CGFloat)fontSize color:(UIColor *)color
{
    IFIcon *icon = [self iconWithType:type fontSize:fontSize];
    icon.color = color;
    return icon;
}

+ (instancetype)iconWithCode:(NSString *)code fontSize:(CGFloat)fontSize
{
    return [[self alloc] initWithCode:code fontSize:fontSize];
}

+ (instancetype)iconWithIdentifier:(NSString *)identifier fontSize:(CGFloat)fontSize
{
    NSString *code = [self allIcons][identifier];
    if ([code isKindOfClass:[NSString class]]) {
        IFIcon *icon = [self iconWithCode:code fontSize:fontSize];
        icon->_identifier = [identifier copy];
        return icon;
    }
    return nil;
}

+ (UIFont *)fontWithSize:(CGFloat)fontSize
{
    UIFont *font = [UIFont fontWithName:[self fontName] size:fontSize];
    if (!font) {
        IFRegisterFontWithURL([self fontFileURL], NULL);
        font = [UIFont fontWithName:[self fontName] size:fontSize];
    }
    return font;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Getter / Setter

- (NSString *)code
{
    return [self.mutableAttributedString string];
}

- (IFIconType)type
{
    if (0 == _type) {
        _type = IFIconTypeForCode(self.code);
    }
    return _type;
}

- (NSString *)identifier
{
    if (!_identifier) {
        __block NSString *foundIdentifier = nil;
        NSString *code = self.code;
        [[[self class] allIcons] enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj isEqualToString:code]) {
                foundIdentifier = key;
                *stop = YES;
            }
        }];
        _identifier = foundIdentifier;
    }
    return _identifier;
}

- (NSAttributedString *)attributedString
{
    return [self.mutableAttributedString copy];
}

- (UIFont *)font
{
    return [self attribute:NSFontAttributeName];
}

- (CGFloat)fontSize
{
    return self.font.pointSize;
}

- (void)setFontSize:(CGFloat)fontSize
{
    if (fontSize != self.fontSize) {
        [self addAttribute:NSFontAttributeName value:[[self class] fontWithSize:fontSize]];
    }
}

- (UIColor *)color
{
    return [self attribute:NSForegroundColorAttributeName];
}

- (void)setColor:(UIColor *)color
{
    if (color) {
        [self addAttribute:NSForegroundColorAttributeName value:color];
    } else {
        [self removeAttribute:NSForegroundColorAttributeName];
    }
}

- (void)setDrawingPaddingMultiplie:(UIOffset)multiplie
{
    _drawingPaddingMultiplie = UIOffsetMake(multiplie.horizontal > 0 ? multiplie.horizontal : 0,
                                            multiplie.vertical > 0 ? multiplie.vertical : 0);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private

- (NSRange)rangeForMutableAttributedString
{
    return NSMakeRange(0, self.mutableAttributedString.length);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Attributes

- (NSDictionary *)attributes
{
    return [self.mutableAttributedString attributesAtIndex:0 effectiveRange:NULL];
}

- (id)attribute:(NSString *)attributeName
{
    return [self.mutableAttributedString attribute:attributeName atIndex:0 effectiveRange:NULL];
}

- (void)setAttributes:(NSDictionary *)attributes
{
    attributes || (attributes = @{});
    if (!attributes[NSFontAttributeName]) {
        NSMutableDictionary *dict = [attributes mutableCopy];
        dict[NSFontAttributeName] = self.font;
        attributes = dict;
    }
    [self.mutableAttributedString setAttributes:attributes range:[self rangeForMutableAttributedString]];
}

- (void)addAttribute:(NSString *)name value:(id)value
{
    [self.mutableAttributedString addAttribute:name value:value range:[self rangeForMutableAttributedString]];
}

- (void)addAttributes:(NSDictionary *)attrs
{
    if ([attrs isKindOfClass:[NSDictionary class]] && [attrs count]) {
        [self.mutableAttributedString addAttributes:attrs range:[self rangeForMutableAttributedString]];
    }
}

- (void)removeAttribute:(NSString *)name
{
    [self.mutableAttributedString removeAttribute:name range:[self rangeForMutableAttributedString]];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Image Drawing

- (void)_fillBackgroundColorForContext:(CGContextRef)context backgroundSize:(CGSize)size
{
    if (self.drawingBackgroundColor) {
        [self.drawingBackgroundColor setFill];
        CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    }
}

- (BOOL)_iconSize:(CGSize)iconSize isBiggerThanImageSize:(CGSize)imageSize
{
    return (iconSize.width * (1.0 + self.drawingPaddingMultiplie.horizontal) > imageSize.width ||
            iconSize.height * (1.0 + self.drawingPaddingMultiplie.vertical) > imageSize.height);
}

- (void)_drawWithImageSize:(CGSize)imageSize
{
    NSAttributedString *string = self.mutableAttributedString;
    CGSize iconSize = [string size];
    
    if (self.adjustsFontSizeWhileDrawing && [self _iconSize:iconSize isBiggerThanImageSize:imageSize]) {
        NSMutableDictionary *attrs = [self.attributes mutableCopy];
        CGFloat tmpFontSize = self.fontSize;
        while (tmpFontSize > 3.0/*minimumFontSize*/ && [self _iconSize:iconSize isBiggerThanImageSize:imageSize]) {
            tmpFontSize -= 1.5;
            attrs[NSFontAttributeName] = [[self class] fontWithSize:tmpFontSize];
            iconSize = [self.code sizeWithAttributes:attrs];
        }
        string = [[NSAttributedString alloc] initWithString:self.code attributes:attrs];
    }
    
    CGFloat xOffset = (imageSize.width - iconSize.width) / 2.0;
    xOffset += self.drawingPositionAdjustment.horizontal;
    CGFloat yOffset = (imageSize.height - iconSize.height) / 2.0;
    yOffset += self.drawingPositionAdjustment.vertical;
    CGRect rect = CGRectMake(xOffset, yOffset, iconSize.width, iconSize.height);
    [string drawInRect:rect];
}

- (void)fillBackgroundForContext:(CGContextRef)context backgroundSize:(CGSize)size
{
    if (self.drawingBackgroundColor) {
        [self.drawingBackgroundColor setFill];
        CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    }
}

- (UIImage *)imageWithSize:(CGSize)imageSize
{
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self _fillBackgroundColorForContext:context backgroundSize:imageSize];
    [self _drawWithImageSize:imageSize];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithType:(IFIconType)type
                     color:(UIColor *)color
           backgroundColor:(UIColor *)backgroundColor
        positionAdjustment:(UIOffset)positionAdjustment
                attributes:(NSDictionary *)attributes
                  fontSize:(CGFloat)fontSize
                 imageSize:(CGSize)imageSize

{
    IFIcon *icon = [self iconWithType:type fontSize:fontSize];
    icon.color = color;
    icon.drawingBackgroundColor = backgroundColor;
    icon.drawingPositionAdjustment = positionAdjustment;
    [icon addAttributes:attributes];
    return [icon imageWithSize:imageSize];
}

+ (UIImage *)imageWithType:(IFIconType)type color:(UIColor *)color fontSize:(CGFloat)fontSize imageSize:(CGSize)imageSize
{
    return [self imageWithType:type color:color backgroundColor:nil positionAdjustment:UIOffsetZero attributes:nil fontSize:fontSize imageSize:imageSize];
}

+ (UIImage *)imageWithType:(IFIconType)type color:(UIColor *)color fontSize:(CGFloat)fontSize
{
    IFIcon *icon = [self iconWithType:type fontSize:fontSize];
    icon.color = color;
    CGSize imageSize = [icon.mutableAttributedString size];
    imageSize.width *= (1.0 + [self defaultDrawingPaddingMultiplie].horizontal);
    imageSize.height *= (1.0 + [self defaultDrawingPaddingMultiplie].vertical);
    return [icon imageWithSize:imageSize];
}

+ (UIImage *)imageWithType:(IFIconType)type color:(UIColor *)color imageSize:(CGSize)imageSize
{
    CGFloat fontSize = fminf(imageSize.width, imageSize.height);
    return [self imageWithType:type color:color backgroundColor:nil positionAdjustment:UIOffsetZero attributes:nil fontSize:fontSize imageSize:imageSize];
}

@end

@implementation IFIcon (Subclassing)

+ (NSURL *)fontFileURL
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

+ (NSString *)fontName
{
    return [[[self fontFileURL] lastPathComponent] stringByDeletingPathExtension];
}

+ (NSDictionary *)allIcons
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

+ (UIOffset)defaultDrawingPaddingMultiplie
{
    return UIOffsetMake(0.1, 0.05);
}

@end

@implementation UIImage (IFIconAdditions)

+ (UIImage *)if_imageWithStackedIcons:(NSArray <IFIcon *>*)icons imageSize:(CGSize)imageSize
{
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (IFIcon *icon in icons) {
        if ([icon isKindOfClass:[IFIcon class]]) {
            [icon _fillBackgroundColorForContext:context backgroundSize:imageSize];
            [icon _drawWithImageSize:imageSize];
        }
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

BOOL IFRegisterFontWithURL(NSURL *fontFileURL, NSError **error)
{
    NSError *err = nil;
    
    if (fontFileURL.isFileURL && [[NSFileManager defaultManager] fileExistsAtPath:fontFileURL.path]) {
        CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)fontFileURL);
        CGFontRef font = CGFontCreateWithDataProvider(fontDataProvider);
        CGDataProviderRelease(fontDataProvider);
        CFErrorRef registerError = NULL;
        CTFontManagerRegisterGraphicsFont(font, &registerError);
        CGFontRelease(font);
        
        err = (__bridge NSError *)registerError;
    } else {
        err = [NSError errorWithDomain:@"IconFontsKitErrorDomain"
                                  code:-1
                              userInfo:@{NSLocalizedDescriptionKey: [NSString stringWithFormat:@"fontFileURL(%@) does not exist.", fontFileURL]}];
    }
    
    if (error) {
        *error = err;
    }
    
    return !!err;
}

NSString *IFIconCodeForType(IFIconType type)
{
    return [NSString stringWithFormat:@"%C", type];
}

IFIconType IFIconTypeForCode(NSString *code)
{
    static NSNumberFormatter *__gNumberFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __gNumberFormatter = [[NSNumberFormatter alloc] init];
    });
    return [[__gNumberFormatter numberFromString:code] unsignedShortValue];
}
