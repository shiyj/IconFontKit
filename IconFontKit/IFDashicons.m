#import "IFDashicons.h"

@implementation IFDashicons

+ (NSURL *)fontFileURL
{
    return [[[NSBundle mainBundle] resourceURL] URLByAppendingPathComponent:@"dashicons.ttf"];
}

+ (NSDictionary *)allIcons
{
    return @{
             @"dashicons-menu":                          @"\uf333",
             @"dashicons-admin-site":                    @"\uf319",
             @"dashicons-dashboard":                     @"\uf226",
             @"dashicons-admin-media":                   @"\uf104",
             @"dashicons-admin-page":                    @"\uf105",
             @"dashicons-admin-comments":                @"\uf101",
             @"dashicons-admin-appearance":              @"\uf100",
             @"dashicons-admin-plugins":                 @"\uf106",
             @"dashicons-admin-users":                   @"\uf110",
             @"dashicons-admin-tools":                   @"\uf107",
             @"dashicons-admin-settings":                @"\uf108",
             @"dashicons-admin-network":                 @"\uf112",
             @"dashicons-admin-generic":                 @"\uf111",
             @"dashicons-admin-home":                    @"\uf102",
             @"dashicons-admin-collapse":                @"\uf148",
             @"dashicons-filter":                        @"\uf536",
             @"dashicons-admin-customizer":              @"\uf540",
             @"dashicons-admin-multisite":               @"\uf541",
             @"dashicons-admin-links":                   @"\uf103",
             @"dashicons-format-links":                  @"\uf103",
             @"dashicons-admin-post":                    @"\uf109",
             @"dashicons-format-standard":               @"\uf109",
             @"dashicons-format-image":                  @"\uf128",
             @"dashicons-format-gallery":                @"\uf161",
             @"dashicons-format-audio":                  @"\uf127",
             @"dashicons-format-video":                  @"\uf126",
             @"dashicons-format-chat":                   @"\uf125",
             @"dashicons-format-status":                 @"\uf130",
             @"dashicons-format-aside":                  @"\uf123",
             @"dashicons-format-quote":                  @"\uf122",
             @"dashicons-welcome-write-blog":            @"\uf119",
             @"dashicons-welcome-edit-page":             @"\uf119",
             @"dashicons-welcome-add-page":              @"\uf133",
             @"dashicons-welcome-view-site":             @"\uf115",
             @"dashicons-welcome-widgets-menus":         @"\uf116",
             @"dashicons-welcome-comments":              @"\uf117",
             @"dashicons-welcome-learn-more":            @"\uf118",
             @"dashicons-image-crop":                    @"\uf165",
             @"dashicons-image-rotate":                  @"\uf531",
             @"dashicons-image-rotate-left":             @"\uf166",
             @"dashicons-image-rotate-right":            @"\uf167",
             @"dashicons-image-flip-vertical":           @"\uf168",
             @"dashicons-image-flip-horizontal":         @"\uf169",
             @"dashicons-image-filter":                  @"\uf533",
             @"dashicons-undo":                          @"\uf171",
             @"dashicons-redo":                          @"\uf172",
             @"dashicons-editor-bold":                   @"\uf200",
             @"dashicons-editor-italic":                 @"\uf201",
             @"dashicons-editor-ul":                     @"\uf203",
             @"dashicons-editor-ol":                     @"\uf204",
             @"dashicons-editor-quote":                  @"\uf205",
             @"dashicons-editor-alignleft":              @"\uf206",
             @"dashicons-editor-aligncenter":            @"\uf207",
             @"dashicons-editor-alignright":             @"\uf208",
             @"dashicons-editor-insertmore":             @"\uf209",
             @"dashicons-editor-spellcheck":             @"\uf210",
             @"dashicons-editor-distractionfree":        @"\uf211",
             @"dashicons-editor-expand":                 @"\uf211",
             @"dashicons-editor-contract":               @"\uf506",
             @"dashicons-editor-kitchensink":            @"\uf212",
             @"dashicons-editor-underline":              @"\uf213",
             @"dashicons-editor-justify":                @"\uf214",
             @"dashicons-editor-textcolor":              @"\uf215",
             @"dashicons-editor-paste-word":             @"\uf216",
             @"dashicons-editor-paste-text":             @"\uf217",
             @"dashicons-editor-removeformatting":       @"\uf218",
             @"dashicons-editor-video":                  @"\uf219",
             @"dashicons-editor-customchar":             @"\uf220",
             @"dashicons-editor-outdent":                @"\uf221",
             @"dashicons-editor-indent":                 @"\uf222",
             @"dashicons-editor-help":                   @"\uf223",
             @"dashicons-editor-strikethrough":          @"\uf224",
             @"dashicons-editor-unlink":                 @"\uf225",
             @"dashicons-editor-rtl":                    @"\uf320",
             @"dashicons-editor-break":                  @"\uf474",
             @"dashicons-editor-code":                   @"\uf475",
             @"dashicons-editor-paragraph":              @"\uf476",
             @"dashicons-editor-table":                  @"\uf535",
             @"dashicons-align-left":                    @"\uf135",
             @"dashicons-align-right":                   @"\uf136",
             @"dashicons-align-center":                  @"\uf134",
             @"dashicons-align-none":                    @"\uf138",
             @"dashicons-lock":                          @"\uf160",
             @"dashicons-unlock":                        @"\uf528",
             @"dashicons-calendar":                      @"\uf145",
             @"dashicons-calendar-alt":                  @"\uf508",
             @"dashicons-visibility":                    @"\uf177",
             @"dashicons-hidden":                        @"\uf530",
             @"dashicons-post-status":                   @"\uf173",
             @"dashicons-edit":                          @"\uf464",
             @"dashicons-post-trash":                    @"\uf182",
             @"dashicons-trash":                         @"\uf182",
             @"dashicons-sticky":                        @"\uf537",
             @"dashicons-external":                      @"\uf504",
             @"dashicons-arrow-up":                      @"\uf142",
             @"dashicons-arrow-down":                    @"\uf140",
             @"dashicons-arrow-left":                    @"\uf141",
             @"dashicons-arrow-right":                   @"\uf139",
             @"dashicons-arrow-up-alt":                  @"\uf342",
             @"dashicons-arrow-down-alt":                @"\uf346",
             @"dashicons-arrow-left-alt":                @"\uf340",
             @"dashicons-arrow-right-alt":               @"\uf344",
             @"dashicons-arrow-up-alt2":                 @"\uf343",
             @"dashicons-arrow-down-alt2":               @"\uf347",
             @"dashicons-arrow-left-alt2":               @"\uf341",
             @"dashicons-arrow-right-alt2":              @"\uf345",
             @"dashicons-leftright":                     @"\uf229",
             @"dashicons-sort":                          @"\uf156",
             @"dashicons-randomize":                     @"\uf503",
             @"dashicons-list-view":                     @"\uf163",
             @"dashicons-exerpt-view":                   @"\uf164",
             @"dashicons-excerpt-view":                  @"\uf164",
             @"dashicons-grid-view":                     @"\uf509",
             @"dashicons-move":                          @"\uf545",
             @"dashicons-hammer":                        @"\uf308",
             @"dashicons-art":                           @"\uf309",
             @"dashicons-migrate":                       @"\uf310",
             @"dashicons-performance":                   @"\uf311",
             @"dashicons-universal-access":              @"\uf483",
             @"dashicons-universal-access-alt":          @"\uf507",
             @"dashicons-tickets":                       @"\uf486",
             @"dashicons-nametag":                       @"\uf484",
             @"dashicons-clipboard":                     @"\uf481",
             @"dashicons-heart":                         @"\uf487",
             @"dashicons-megaphone":                     @"\uf488",
             @"dashicons-schedule":                      @"\uf489",
             @"dashicons-wordpress":                     @"\uf120",
             @"dashicons-wordpress-alt":                 @"\uf324",
             @"dashicons-pressthis":                     @"\uf157",
             @"dashicons-update":                        @"\uf463",
             @"dashicons-screenoptions":                 @"\uf180",
             @"dashicons-cart":                          @"\uf174",
             @"dashicons-feedback":                      @"\uf175",
             @"dashicons-cloud":                         @"\uf176",
             @"dashicons-translation":                   @"\uf326",
             @"dashicons-tag":                           @"\uf323",
             @"dashicons-category":                      @"\uf318",
             @"dashicons-archive":                       @"\uf480",
             @"dashicons-tagcloud":                      @"\uf479",
             @"dashicons-text":                          @"\uf478",
             @"dashicons-media-archive":                 @"\uf501",
             @"dashicons-media-audio":                   @"\uf500",
             @"dashicons-media-code":                    @"\uf499",
             @"dashicons-media-default":                 @"\uf498",
             @"dashicons-media-document":                @"\uf497",
             @"dashicons-media-interactive":             @"\uf496",
             @"dashicons-media-spreadsheet":             @"\uf495",
             @"dashicons-media-text":                    @"\uf491",
             @"dashicons-media-video":                   @"\uf490",
             @"dashicons-playlist-audio":                @"\uf492",
             @"dashicons-playlist-video":                @"\uf493",
             @"dashicons-controls-play":                 @"\uf522",
             @"dashicons-controls-pause":                @"\uf523",
             @"dashicons-controls-forward":              @"\uf519",
             @"dashicons-controls-skipforward":          @"\uf517",
             @"dashicons-controls-back":                 @"\uf518",
             @"dashicons-controls-skipback":             @"\uf516",
             @"dashicons-controls-repeat":               @"\uf515",
             @"dashicons-controls-volumeon":             @"\uf521",
             @"dashicons-controls-volumeoff":            @"\uf520",
             @"dashicons-yes":                           @"\uf147",
             @"dashicons-no":                            @"\uf158",
             @"dashicons-no-alt":                        @"\uf335",
             @"dashicons-plus":                          @"\uf132",
             @"dashicons-plus-alt":                      @"\uf502",
             @"dashicons-plus-alt2":                     @"\uf543",
             @"dashicons-minus":                         @"\uf460",
             @"dashicons-dismiss":                       @"\uf153",
             @"dashicons-marker":                        @"\uf159",
             @"dashicons-star-filled":                   @"\uf155",
             @"dashicons-star-half":                     @"\uf459",
             @"dashicons-star-empty":                    @"\uf154",
             @"dashicons-flag":                          @"\uf227",
             @"dashicons-info":                          @"\uf348",
             @"dashicons-warning":                       @"\uf534",
             @"dashicons-share":                         @"\uf237",
             @"dashicons-share1":                        @"\uf237",
             @"dashicons-share-alt":                     @"\uf240",
             @"dashicons-share-alt2":                    @"\uf242",
             @"dashicons-twitter":                       @"\uf301",
             @"dashicons-rss":                           @"\uf303",
             @"dashicons-email":                         @"\uf465",
             @"dashicons-email-alt":                     @"\uf466",
             @"dashicons-facebook":                      @"\uf304",
             @"dashicons-facebook-alt":                  @"\uf305",
             @"dashicons-networking":                    @"\uf325",
             @"dashicons-googleplus":                    @"\uf462",
             @"dashicons-location":                      @"\uf230",
             @"dashicons-location-alt":                  @"\uf231",
             @"dashicons-camera":                        @"\uf306",
             @"dashicons-images-alt":                    @"\uf232",
             @"dashicons-images-alt2":                   @"\uf233",
             @"dashicons-video-alt":                     @"\uf234",
             @"dashicons-video-alt2":                    @"\uf235",
             @"dashicons-video-alt3":                    @"\uf236",
             @"dashicons-vault":                         @"\uf178",
             @"dashicons-shield":                        @"\uf332",
             @"dashicons-shield-alt":                    @"\uf334",
             @"dashicons-sos":                           @"\uf468",
             @"dashicons-search":                        @"\uf179",
             @"dashicons-slides":                        @"\uf181",
             @"dashicons-analytics":                     @"\uf183",
             @"dashicons-chart-pie":                     @"\uf184",
             @"dashicons-chart-bar":                     @"\uf185",
             @"dashicons-chart-line":                    @"\uf238",
             @"dashicons-chart-area":                    @"\uf239",
             @"dashicons-groups":                        @"\uf307",
             @"dashicons-businessman":                   @"\uf338",
             @"dashicons-id":                            @"\uf336",
             @"dashicons-id-alt":                        @"\uf337",
             @"dashicons-products":                      @"\uf312",
             @"dashicons-awards":                        @"\uf313",
             @"dashicons-forms":                         @"\uf314",
             @"dashicons-testimonial":                   @"\uf473",
             @"dashicons-portfolio":                     @"\uf322",
             @"dashicons-book":                          @"\uf330",
             @"dashicons-book-alt":                      @"\uf331",
             @"dashicons-download":                      @"\uf316",
             @"dashicons-upload":                        @"\uf317",
             @"dashicons-backup":                        @"\uf321",
             @"dashicons-clock":                         @"\uf469",
             @"dashicons-lightbulb":                     @"\uf339",
             @"dashicons-microphone":                    @"\uf482",
             @"dashicons-desktop":                       @"\uf472",
             @"dashicons-laptop":                        @"\uf547",
             @"dashicons-tablet":                        @"\uf471",
             @"dashicons-smartphone":                    @"\uf470",
             @"dashicons-phone":                         @"\uf525",
             @"dashicons-smiley":                        @"\uf328",
             @"dashicons-index-card":                    @"\uf510",
             @"dashicons-carrot":                        @"\uf511",
             @"dashicons-building":                      @"\uf512",
             @"dashicons-store":                         @"\uf513",
             @"dashicons-album":                         @"\uf514",
             @"dashicons-palmtree":                      @"\uf527",
             @"dashicons-tickets-alt":                   @"\uf524",
             @"dashicons-money":                         @"\uf526",
             @"dashicons-thumbs-up":                     @"\uf529",
             @"dashicons-thumbs-down":                   @"\uf542",
             @"dashicons-layout":                        @"\uf538",
             @"dashicons-paperclip":                     @"\uf546",
             };
}

@end
