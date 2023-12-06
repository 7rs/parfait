Rectangle = {
    color = DEFAULT_COLORS.BLACK,
}
setmetatable(Rectangle, { __index = ColoredElement })

--- Fill the specified area with the specified color
function Rectangle:fill()
    wgui.fill_rectangle(
        self.left, self.top, self.right, self.bottom,
        self.color.red, self.color.green, self.color.blue, self.color.alpha
    )
end

--- Draws a specified rectangle of a specified size
---@param thickness number
function Rectangle:draw(thickness)
    wgui.draw_rectangle(
        self.left, self.top, self.right, self.bottom,
        self.color.red, self.color.green, self.color.blue, self.color.alpha,
        thickness
    )
end

Ellipse = {
    color = DEFAULT_COLORS.WHITE,
}
setmetatable(Ellipse, { __index = ColoredElement })

--- Fill a ellipse of a specified radius at a specified position in a specified color
function Ellipse:fill()
    wgui.fill_ellipse(
        self.left, self.top, self.width // 2, self.height // 2,
        self.color.red, self.color.green, self.color.blue, self.color.alpha
    )
end

--- Draws a ellipse of a specified radius at a specified position in a specified color
---@param thickness number
function Ellipse:draw(thickness)
    wgui.draw_ellipse(
        self.left, self.top, self.width // 2, self.height // 2,
        self.color.red, self.color.green, self.color.blue, self.color.alpha,
        thickness
    )
end

Line = {
    color = DEFAULT_COLORS.YELLOW
}
setmetatable(Line, { __index = ColoredElement })

---@param thickness number
function Line:draw(thickness)
    wgui.draw_line(
        self.left, self.top, self.right, self.bottom,
        self.color.red, self.color.green, self.color.blue, self.color.alpha,
        thickness
    )
end
