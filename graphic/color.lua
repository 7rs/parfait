--- Converts the 8bit integer to a float.
--- @param char? integer 0 ~ 255
--- @return number D2DColor 0.0 ~ 1.0
local function convert_char_to_d2d(char)
    return char and (char / 255.0) or 0.0
end

--- Converts the hex string to a decimal.
--- @param hex_string string 00 ~ FF
--- @return integer decimal 0 ~ 255
local function convert_hex_to_decimal(hex_string)
    return tonumber(hex_string, 16)
end

--- @class Color
--- @field red? number 0.0 ~ 1.0
--- @field green? number 0.0 ~ 1.0
--- @field blue? number 0.0 ~ 1.0
--- @field alpha? number 0.0 ~ 1.0
--- A class for easily specifying D2D color.
Color = {
    red = 0.0,
    green = 0.0,
    blue = 0.0,
    alpha = 0.0,
}

--- Converts the hex triplet to the table for generating color class.
--- @param color_code? string hex triplet (#00000000 ~ #FFFFFFFF)
--- @return table<string, number> color_with_decimal
local function convert_hex_triplet_to_decimal(color_code)
    if color_code == nil then
        return {}
    end

    --- @type table<string, number> 
    local color = {}

    if color_code:sub(1, 1) == "#" then
        color_code = color_code:sub(2)
    end

    local length = color_code:len()
    if length >= 6 then
        color.red = convert_hex_to_decimal(color_code:sub(1, 2))
        color.green = convert_hex_to_decimal(color_code:sub(3, 4))
        color.blue = convert_hex_to_decimal(color_code:sub(5, 6))
    end

    if length == 8 then
        color.alpha = convert_char_to_d2d(convert_hex_to_decimal(color_code:sub(7, 8)))
    end

    return color
end

--- Generates the color class and returns it.
--- @param color_code? string hex triplet (#00000000 ~ #FFFFFFFF)
--- @param red? number 0 ~ 255
--- @param green? number 0 ~ 255
--- @param blue? number 0 ~ 255
--- @param alpha? number 0.0 ~ 1.0
--- @return Color
function Color:new(color_code, red, green, blue, alpha)
    local color = convert_hex_triplet_to_decimal(color_code)

    color.red = convert_char_to_d2d(red)
    color.green = convert_char_to_d2d(green)
    color.blue = convert_char_to_d2d(blue)
    color.alpha = alpha or 0.0

    setmetatable(color, {__index = Color})
    return self
end
