--- @module "rectangle"
local rectangle = {}


local colorset = require("graphic.theme.colorset")
local colored = require("graphic.elements.colored")


--- @class Rectangle: ColoredElement
--- @field color? D2DColor
local Rectangle = {
    color = colorset.PARFAIT.BLACK,
}

--- @param color? D2DColor
--- @param left? number distance from left
--- @param top? number distance from top
--- @param width? number width of element
--- @param height? number width of element
--- @param right? number distance from right
--- @param bottom? number distance from bottom
--- @return Rectangle
function rectangle.new(color, left, top, width, height, right, bottom)
    --- @type any
    local self = colored.new(color, left, top, width, height, right, bottom)
    setmetatable(self, { __index = Rectangle })
    return self
end

--- Fill the specified area with the specified color.
function Rectangle:fill()
    wgui.fill_rectangle(
        self.left, self.top, self.right, self.bottom,
        self.color.red, self.color.green, self.color.blue, self.color.alpha
    )
end

--- Draws a specified rectangle of a specified size.
---@param thickness integer
function Rectangle:draw(thickness)
    wgui.draw_rectangle(
        self.left, self.top, self.right, self.bottom,
        self.color.red, self.color.green, self.color.blue, self.color.alpha,
        thickness
    )
end

return rectangle
