--- @enum FontStyles
--- Oblique wasn't supported.
FONT_STYLES = {
    NORMAL = 0,
    BOLD = 1,
    ITALIC = 2,
}

--- @enum FontAligns
FONT_ALIGNS = {
    START = 0,
    END = 1,
    CENTER = 2,
    STRETCH = 3,
}

--- @enum FontVerticalAligns
FONT_VERTIACAL_ALIGNS = {
    START = 0,
    END = 1,
    CENTER = 2,
}

--- @enum FontSizes
FONT_SIZES = {
    SMALL = 10,
    MEDIUM = 14,
    LARGE = 18,
}

--- @enum FontFamilies
FONT_FAMILIES = {
    -- TODO: Need to add some fonts.
    SEGOE_UI = "Segoe UI",
    CONSOLAS = "Consolas",
    YU_GOTHIC = "Yu Gothic",
    YU_GOTHIC_UI = "Yu Gothic UI",
}

--- @enum FontWeights
FONT_WEIGHTS = {
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

--- A class for text elements.
--- @class Font
--- @field style? FontStyles
--- @field color? Color
--- @field align? FontAligns
--- @field verticalAlign? FontVerticalAligns
--- @field size? FontSizes
--- @field family? FontFamilies
--- @field weight? FontWeights
Font = {
    style = FONT_STYLES.NORMAL,
    color = DEFAULT_COLORS.WHITE,
    align = FONT_ALIGNS.START,
    verticalAlign = FONT_VERTIACAL_ALIGNS.START,
    size = FONT_SIZES.MEDIUM,
    family = FONT_FAMILIES.SEGOE_UI,
    weight = FONT_WEIGHTS.NORMAL,
}

--- Generates the font class and returns it.
--- @param style? FontStyles
--- @param color? Color
--- @param align? FontAligns
--- @param verticalAlign? FontVerticalAligns
--- @param size? FontSizes
--- @param fontFamily? FontFamilies
--- @param weight? FontWeights
--- @return Font
function Font:new(style, color, align, verticalAlign, size, fontFamily, weight)
    local font = {
        color = color or Font.color,
        align = align or Font.align,
        verticalAlign = verticalAlign or Font.verticalAlign,
        size = size or Font.size,
        family = fontFamily or Font.family,
        weight = weight or Font.weight,
    }

    if style == FONT_STYLES.BOLD then
        font.weight = FONT_WEIGHTS.BOLD
    end

    setmetatable(font, { __index = self })
    return font
end
