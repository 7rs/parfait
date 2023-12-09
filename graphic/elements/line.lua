--- @module "line"
local line = {}


local colorset = require("graphic.theme.colorset")
local colored_element = require("graphic.elements.colored_element")


--- @class Line: ColoredElement
--- @field color? D2DColor
local Line = {
    color = colorset.PARFAIT.YELLOW
}

--- @param color? D2DColor
--- @param left? number distance from left
--- @param top? number distance from top
--- @param width? number width of element
--- @param height? number width of element
--- @param right? number distance from right
--- @param bottom? number distance from bottom
--- @return Line
function line.new(color, left, top, width, height, right, bottom)
    --- @type any
    local self = colored_element.new(color, left, top, width, height, right, bottom)
    setmetatable(self, { __index = Line })
    return self
end

---@param thickness integer
function Line:draw(thickness)
    wgui.draw_line(
        self.left, self.top, self.right, self.bottom,
        self.color.red, self.color.green, self.color.blue, self.color.alpha,
        thickness
    )
end

return line
