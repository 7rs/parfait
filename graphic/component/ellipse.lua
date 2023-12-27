--- @module "ellipse"
local ellipse = {}


local colorset = require("graphic.theme.colorset")
local colored = require("graphic.elements.colored")


--- @class Ellipse: ColoredElement
--- @field color? D2DColor
local Ellipse = {
    color = colorset.PARFAIT.WHITE,
}

--- @param color? D2DColor
--- @param left? number distance from left
--- @param top? number distance from top
--- @param width? number width of element
--- @param height? number width of element
--- @param right? number distance from right
--- @param bottom? number distance from bottom
--- @return Ellipse
function ellipse.new(color, left, top, width, height, right, bottom)
    --- @type any
    local self = colored.new(color, left, top, width, height, right, bottom)
    setmetatable(self, { __index = Ellipse })
    return self
end

--- Fill a ellipse of a specified radius at a specified position in a specified color.
function Ellipse:fill()
    wgui.fill_ellipse(
        self.left, self.top, self.width // 2, self.height // 2,
        self.color.red, self.color.green, self.color.blue, self.color.alpha
    )
end

--- Draws a ellipse of a specified radius at a specified position in a specified color.
---@param thickness integer
function Ellipse:draw(thickness)
    wgui.draw_ellipse(
        self.left, self.top, self.width // 2, self.height // 2,
        self.color.red, self.color.green, self.color.blue, self.color.alpha,
        thickness
    )
end

return ellipse
