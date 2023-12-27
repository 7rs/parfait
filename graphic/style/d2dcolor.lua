--- This module simplifies the specification of colors in Direct2D.  <br/>
--- more information:  <br/>
---   https://learn.microsoft.com/en-us/windows/win32/learnwin32/using-color-in-direct2d  <br/>
---   https://simple.wikipedia.org/wiki/RGB  <br/>
---   https://simple.wikipedia.org/wiki/Web_color  <br/>
--- @module "d2dcolor"
local d2dcolor = {}


--- This function converts an 8-bit integer to a float.
--- @param i8? integer 0 ~ 255
--- @return number D2DColor 0.0 ~ 1.0
local function convert_char_to_d2d(i8)
    return i8 and (i8 / 255.0) or 0.0
end

--- This function converts a hexadecimal string to a decimal integer.
--- @param hex_string string 00 ~ FF
--- @return integer decimal 0 ~ 255
local function convert_hex_to_decimal(hex_string)
    return tonumber(hex_string, 16)
end

--- This is a class for the specification of colors in Direct2D.
--- @class D2DColor
--- @field red number 0.0 ~ 1.0
--- @field green number 0.0 ~ 1.0
--- @field blue number 0.0 ~ 1.0
--- @field alpha number 0.0 ~ 1.0
local D2DColor = {
    red = 0.0,
    green = 0.0,
    blue = 0.0,
    alpha = 1.0,
}

--- This function converts a hex triplet string to a RGBA table.
--- @param color_code? string hex triplet `#000000` ~ `#FFFFFF`
--- @return table<string, number> color_with_decimal
local function convert_hex_triplet_to_decimal(color_code)
    if color_code == nil then
        return {
            red = D2DColor.red,
            green = D2DColor.green,
            blue = D2DColor.blue,
        }
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

--- This function generates the color class and returns it.
--- @param color_code? string hex triplet `#000000` ~ `#FFFFFF`
--- @param red? number 0 ~ 255
--- @param green? number 0 ~ 255
--- @param blue? number 0 ~ 255
--- @param alpha? number 0.0 ~ 1.0
--- @return D2DColor
function d2dcolor.new(color_code, red, green, blue, alpha)
    --- @type any
    local self = convert_hex_triplet_to_decimal(color_code)
    self.red = convert_char_to_d2d(self.red or red)
    self.green = convert_char_to_d2d(self.green or green)
    self.blue = convert_char_to_d2d(self.blue or blue)
    self.alpha = alpha or D2DColor.alpha

    setmetatable(self, { __index = D2DColor })
    return self
end

--- This function returns a boolean whether the specified color is pure black.
--- @param color D2DColor
--- @return boolean
function d2dcolor.is_black(color)
    if color.red ~= 0 then
        return false
    elseif color.green ~= 0 then
        return false
    elseif color.blue ~= 0 then
        return false
    end

    return true
end

return d2dcolor
