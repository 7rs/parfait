--- @module "theme"
local theme = {}


local d2dcolor = require("graphic.style.d2dcolor")
local font = require("graphic.style.font")
local colorset = require("graphic.style.colorset")
local fontset = require("graphic.style.fontset")


--- @enum ParfaitColorSet
local PARFAIT_COLORSET = colorset.new(
    d2dcolor.new("#202040"), -- black
    d2dcolor.new("#606080"), -- gray
    d2dcolor.new("#F0F0FF"), -- white
    d2dcolor.new("#FFD0D0"), -- pink
    d2dcolor.new("#FF8080"), -- red
    d2dcolor.new("#FFA060"), -- orange
    d2dcolor.new("#F0FF80"), -- yellow
    d2dcolor.new("#60FF60"), -- green
    d2dcolor.new("#A0E0FF"), -- cyan
    d2dcolor.new("#6060FF"), -- blue
    d2dcolor.new("#D080FF")  -- purple
)

--- @enum ParfaitFontSet
local PARFAIT_FONTSET = fontset.new(
    font.new(nil, nil, nil, nil, font.SIZES.SMALL),              -- small
    font.new(nil, nil, nil, nil, font.SIZES.MEDIUM),             -- medium
    font.new(font.STYLES.BOLD, nil, nil, nil, font.SIZES.LARGE), -- large
    font.new(font.STYLES.BOLD, nil, nil, nil, font.SIZES.HEADER) -- header
)

--- @class Theme
--- @field colorset? Colorset
--- @field fontset? Fontset
Theme = {
    colorset = PARFAIT_COLORSET,
    fontset = PARFAIT_FONTSET,
}

--- @param colorset? Colorset
--- @param fontset? Fontset
--- @return Theme
function theme.new(colorset, fontset)
    local self = {
        colorset = colorset or Theme.colorset,
        fontset = fontset or Theme.fontset,
    }

    --- @type Theme
    setmetatable(self, { __index = Theme })
    return self
end

return theme
