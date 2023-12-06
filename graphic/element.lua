--- @class Element
--- @field left? integer
--- @field top? integer
--- @field width? integer
--- @field height? integer
--- @field right? integer
--- @field bottom? integer
--- A class for all elements.
Element = {
    left = 0,
    top = 0,
    width = 0,
    height = 0,
    right = 0,
    bottom = 0,
}

--- Generates the element class and returns it.
--- @param left? integer distance from left
--- @param top? integer distance from top 
--- @param width? integer width of element
--- @param height? integer width of element
--- @param right? integer distance from right
--- @param bottom? integer distance from bottom
--- @return Element
function Element:new(left, top, width, height, right, bottom)
    if left ~= nil and top ~= nil then
        if width ~= nil and height ~= nil then -- left, top, width, height nil, nil
            right = left + width
            bottom = top + height
        elseif right ~= nil and bottom ~= nil then -- left, top, nil, nil, right, bottom
            width = right - left
            height = bottom - top
        end
    elseif right ~= nil and bottom ~= nil then
        if width ~= nil and height ~= nil then -- nil, nil, width, height, right, bottom
            left = right - width
            top = bottom - height
        end
    end

    local element = {
        left = left or 0,
        top = top or 0,
        width = width or 0,
        height = height or 0,
        right = right or 0,
        bottom = bottom or 0,
    }

    setmetatable(element, self)
    self.__index = self
    return element
end

--- @class ColoredElement: Element
--- @field color? Color
--- The element class with color.
ColoredElement = {
    color = DEFAULT_COLORS.PINK,
}

--- Generates the element class with color and returns it.
--- @param left? number distance from left
--- @param top? number distance from top 
--- @param width? number width of element
--- @param height? number width of element
--- @param right? number distance from right
--- @param bottom? number distance from bottom
--- @param color? Color
--- @return Element
function ColoredElement:new(left, top, width, height, right, bottom, color)
    local colored_element = Element:new(left, top, width, height, right, bottom)
    self.color = color

    setmetatable(colored_element, {__index = ColoredElement})
    return self
end
