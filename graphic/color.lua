--- A class for easily specifying D2D color.
Color = {
    red = 0.0,
    green = 0.0,
    blue = 0.0,
    alpha = 0.0,
}

--- Converts the 8bit integer to a float.
--- @param char? number 0 ~ 255
--- @return number D2DColor 0.0 ~ 1.0
local function convertCharToD2D(char)
    return char and (char / 255.0) or 0.0
end

--- Converts the hex string to a decimal.
--- @param hexString string 00 ~ FF
--- @return number decimal 0.0 ~ 1.0
local function convertHexToDec(hexString)
    return tonumber(hexString, 16)
end

--- Converts a hex triplet to the table for generating color class.
--- @param colorCode? string hex triplet (#00000000 ~ #FFFFFFFF)
--- @return table Color not D2D
local function convertHexTripletToDec(colorCode)
    local color = {}
    if colorCode ~= nil then
        if colorCode:sub(1, 1) == "#" then
            colorCode = colorCode:sub(2)
        end

        local length = colorCode:len()
        if length >= 6 then
            color.red = convertHexToDec(colorCode:sub(1, 2))
            color.green = convertHexToDec(colorCode:sub(3, 4))
            color.blue = convertHexToDec(colorCode:sub(5, 6))
        end

        if length == 8 then
            color.alpha = convertCharToD2D(convertHexToDec(colorCode:sub(7, 8)))
        end
    end

    return color
end

--- Generates the color class and returns it.
--- @param colorCode? string hex triplet (#00000000 ~ #FFFFFFFF)
--- @param red? number 0 ~ 255
--- @param green? number 0 ~ 255
--- @param blue? number 0 ~ 255
--- @param alpha? number 0.0 ~ 1.0
--- @return table Color
function Color:new(colorCode, red, green, blue, alpha)
    local color = convertHexTripletToDec(colorCode)

    color.red = convertCharToD2D(red)
    color.green = convertCharToD2D(green)
    color.blue = convertCharToD2D(blue)
    color.alpha = alpha or 0.0

    setmetatable(color, self)
    self.__index = self
    return color
end