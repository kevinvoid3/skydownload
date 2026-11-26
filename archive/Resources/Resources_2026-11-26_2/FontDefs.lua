-------------------------------------------------------------------------------
-- Font Resources
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- SlugFont Resources
-------------------------------------------------------------------------------

-- We are now using Slug to render all localized strings for these supported languages on all platforms
resource "SlugFont" "Latin"							{ source = "Lato/Lato-Light.ttf"  , type = "regular", outline = 0.1, inlineImages = true }
resource "SlugFont" "Latin-Bold"					{ source = "Lato/Lato-Regular.ttf", type = "bold"   , outline = 0.1, inlineImages = true }
resource "SlugFont" "Thai"							{ source = "NotoSans/NotoSansThai-Regular.ttf", type = "regular" }
resource "SlugFont" "Thai-Bold"						{ source = "NotoSans/NotoSansThai-Bold.ttf"   , type = "bold"    }
-- Earlier fonts take precedence over later fonts when rendering
-- Here using MaruMaruGBSrStdN-R for Japanese as a stylistic choice
resource "SlugFont" "Japanese-Common"				{ source = "MaruMaruGBSrStdN-R.otf", locale = "ja" }
-- Korean will use NotoSansKR before NotoSansSC if the locale is set to Korean
resource "SlugFont" "Korean"						{ source = "NotoSans/NotoSansKR-Regular.ttf", locale = "ko" }
-- Traditional and Simplified Chinese will be rendered as 'NotoSansSC'
resource "SlugFont" "Chinese-Uni-1"					{ source = "NotoSans/NotoSansSC-Regular.ttf", include = { "0x4E00,0x62FF" } }
resource "SlugFont" "Chinese-Uni-2"					{ source = "NotoSans/NotoSansSC-Regular.ttf", include = { "0x6300,0x77FF" } }
resource "SlugFont" "Chinese-Uni-3"					{ source = "NotoSans/NotoSansSC-Regular.ttf", include = { "0x7800,0x8CFF" } }
resource "SlugFont" "Chinese-Uni-4"					{ source = "NotoSans/NotoSansSC-Regular.ttf", include = { "0x8D00,0x9FFF" } }
resource "SlugFont" "Chinese-Ext-A"					{ source = "NotoSans/NotoSansSC-Regular.ttf", include = { "0x3400,0x4DBF" } }
resource "SlugFont" "Chinese-Ext-B-I"				{ source = "NotoSans/NotoSansSC-Regular.ttf", include = { "0x20000,0x2EE5F", "0x30000,0x323AF" } }
-- This is just whatever was not included above for coverage
resource "SlugFont" "Chinese-Remaining"				{ source = "NotoSans/NotoSansSC-Regular.ttf", exclude = { "0x4E00,0x9FFF", "0x3400,0x4DBF", "0x20000,0x2EE5F", "0x30000,0x323AF" } }

resource "SlugFont" "Special"						{ source = "Thatgamefont/thatgamefont.ttf", include = { "0x2726,0x2726" } }
resource "SlugFont" "Emoji"							{ source = "Twemoji/TwemojiMozilla.ttf", color = true }

-- Certain languages on non-mobile platforms are only used for user input, so we include them here
if PLATFORM ~= "iphoneos" and PLATFORM ~= "android" then
	resource "SlugFont" "Arabic"					{ source = "NotoSans/NotoSansArabic-Regular.ttf", type = "regular" }
	resource "SlugFont" "Arabic-Bold"				{ source = "NotoSans/NotoSansArabic-Bold.ttf"   , type = "bold"    }
end

-------------------------------------------------------------------------------
-- Font Resources
-------------------------------------------------------------------------------

-- Note: dont move these.  There is an order term in parallel loading that will be thrown off.
-- Ideally these atlases should just be removed, and only Slug used.

-- Image atlas rectangles that reference the atlased font images for debug TextRenderer
resource "Font" "Arial32"    { source = "Arial32.fnt", image = "Arial32" }
resource "Font" "Mono32"     { source = "Consolas32.fnt", image = "Consolas32" }

-- Atlased imaages are in ImageDefs.lua
