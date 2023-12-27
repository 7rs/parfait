--- @module "font"
local font = {}


local colorset = require("graphic.style.colorset")


--- @enum FontStyles
--- Oblique wasn't supported.
font.STYLES = {
    NORMAL = 0,
    BOLD = 1,
    ITALIC = 2,
}

--- @enum FontAligns
font.HORIZONTAL_ALIGNS = {
    START = 0,
    END = 1,
    CENTER = 2,
    STRETCH = 3,
}

--- @enum FontVerticalAligns
font.VERTIACAL_ALIGNS = {
    START = 0,
    END = 1,
    CENTER = 2,
}

--- @enum FontSizes
font.SIZES = {
    SMALL = 10,
    MEDIUM = 14,
    LARGE = 18,
    HEADER = 24,
}

--- @enum FontFamilies
font.FAMILIES = {
    SEGOE_UI = "Segoe UI",
    CONSOLAS = "Consolas",
    YU_GOTHIC = "Yu Gothic",
    YU_GOTHIC_UI = "Yu Gothic UI",
}

--- @enum FontWeights
font.WEIGHTS = {
    THIN = 100,
    EXTRA_LIGHT = 200,
    LIGHT = 300,
    NORMAL = 400,
    MEDIUM = 500,
    SEMI_BOLD = 600,
    BOLD = 700,
    EXTRA_BOLD = 800,
    BLACK = 900,
}

--- This is a class for some text components.
--- @class Font
--- @field style? FontStyles
--- @field color? D2DColor
--- @field align? FontAligns
--- @field verticalAlign? FontVerticalAligns
--- @field size? FontSizes
--- @field family? FontFamilies
--- @field weight? FontWeights
local Font = {
    style = font.STYLES.NORMAL,
    color = colorset.PARFAIT.WHITE,
    align = font.HORIZONTAL_ALIGNS.START,
    verticalAlign = font.VERTIACAL_ALIGNS.START,
    size = font.SIZES.MEDIUM,
    family = font.FAMILIES.SEGOE_UI,
    weight = font.WEIGHTS.NORMAL,
}

--- This function generates the font class and returns it.
--- @param style? FontStyles
--- @param color? D2DColor
--- @param align? FontAligns
--- @param verticalAlign? FontVerticalAligns
--- @param size? FontSizes
--- @param fontFamily? FontFamilies
--- @param weight? FontWeights
--- @return Font
function font.new(style, color, align, verticalAlign, size, fontFamily, weight)
    local self = {
        color = color or Font.color,
        align = align or Font.align,
        verticalAlign = verticalAlign or Font.verticalAlign,
        size = size or Font.size,
        family = fontFamily or Font.family,
        weight = weight or Font.weight,
    }

    if style == font.STYLES.BOLD then
        self.weight = font.WEIGHTS.BOLD
    end

    setmetatable(self, { __index = Font })
    return self
end

return font
