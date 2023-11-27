---@param n? number 0 ~ 255 (1 byte / 8 bits)
---@return number D2DColor 0.0 ~ 1.0
local function convertCharToD2D(n)
    return n and (n / 255.0) or 0.0
end

---@param hex string 00 ~ FF
---@return number D2DColor 0.0 ~ 1.0
local function convertHexToDec(hex)
    return tonumber(hex, 16)
end

Color = {
    red = 0.0,
    green = 0.0,
    blue = 0.0,
    alpha = 0.0,
}

---@param colorCode? string "#00000000" ~ "#FFFFFFFF"
---@param red? number 0 ~ 255
---@param green? number 0 ~ 255
---@param blue? number 0 ~ 255
---@param alpha? number 0.0 ~ 1.0
---@return table Color
function Color:new(colorCode, red, green, blue, alpha)
    if colorCode ~= nil then -- hex triplet to d2d color
        if colorCode:sub(1, 1) == "#" then
            colorCode = colorCode:sub(2)
        end

        local length = colorCode:len()
        if length >= 6 then
            red = convertHexToDec(colorCode:sub(1, 2))
            green = convertHexToDec(colorCode:sub(3, 4))
            blue = convertHexToDec(colorCode:sub(5, 6))
        end

        if length == 8 then
            alpha = convertCharToD2D(convertHexToDec(colorCode:sub(7, 8)))
        end
    end

    -- dec to d2d color
    local color = {
        red = convertCharToD2D(red),
        green = convertCharToD2D(green),
        blue = convertCharToD2D(blue),
        alpha = alpha or 0.0,
    }

    setmetatable(color, self)
    self.__index = self

    return color
end
