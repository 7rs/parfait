--- @module "colored_element"
local colored_element = {}


local colorset = require("graphic.theme.colorset")
local element = require("graphic.elements.element")


--- The element class with color.
--- @class ColoredElement: Element
--- @field color? D2DColor
local ColoredElement = {
    color = colorset.PARFAIT.PINK,
}

--- Generates the element class with color and returns it.
--- @param color? D2DColor
--- @param left? number distance from left
--- @param top? number distance from top
--- @param width? number width of element
--- @param height? number width of element
--- @param right? number distance from right
--- @param bottom? number distance from bottom
--- @return ColoredElement
function colored_element.new(color, left, top, width, height, right, bottom)
    --- @type any
    local self = element.new(left, top, width, height, right, bottom)
    self.color = color

    setmetatable(self, { __index = ColoredElement })
    return self
end

return colored_element
