--- @module "line"
local line = {}


local colorset = require("graphic.theme.colorset")
local colored = require("graphic.elements.colored")


--- This is the element for drawing lines.
--- @class Line: ColoredElement
--- @field color? D2DColor
local Line = {
    color = colorset.PARFAIT.YELLOW
}

--- This function generates and returns the element for drawing a line.
--- @param color? D2DColor
--- @param left? integer distance from left (right >= left >= 0)
--- @param top? integer distance from top (bottom >= top >= 0)
--- @param width? integer width of element (width >= 0 and width == right - left)
--- @param height? integer width of element (height >= 0 and width == bottom - top)
--- @param right? integer distance from right (right >= left >= 0)
--- @param bottom? integer distance from bottom (bottom >= top >= 0)
--- @return Line
function line.new(color, left, top, width, height, right, bottom)
    --- @type any
    local self = colored.new(color, left, top, width, height, right, bottom)

    --- @type Line
    setmetatable(self, { __index = Line })
    return self
end

--- This function draws a line.
---@param thickness integer
function Line:draw(thickness)
    wgui.draw_line(
        self.left, self.top, self.right, self.bottom,
        self.color.red, self.color.green, self.color.blue, self.color.alpha,
        thickness
    )
end

return line
