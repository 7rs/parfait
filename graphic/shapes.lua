--- @class Rectangle: ColoredElement
--- @field color? Color
Rectangle = {
    color = DEFAULT_COLORS.BLACK,
}

--- @param color? Color
--- @param left? number distance from left
--- @param top? number distance from top 
--- @param width? number width of element
--- @param height? number width of element
--- @param right? number distance from right
--- @param bottom? number distance from bottom
--- @return Rectangle
function Rectangle.new(color, left, top, width, height, right, bottom)
    --- @type any
    local self = ColoredElement.new(color, left, top, width, height, right, bottom)
    setmetatable(self, {__index = Rectangle})
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

--- @class Ellipse: ColoredElement
--- @field color? Color
Ellipse = {
    color = DEFAULT_COLORS.WHITE,
}

--- @param color? Color
--- @param left? number distance from left
--- @param top? number distance from top 
--- @param width? number width of element
--- @param height? number width of element
--- @param right? number distance from right
--- @param bottom? number distance from bottom
--- @return Ellipse
function Ellipse.new(color, left, top, width, height, right, bottom)
    --- @type any
    local self = ColoredElement.new(color, left, top, width, height, right, bottom)
    setmetatable(self, {__index = Ellipse})
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

--- @class Line: ColoredElement
--- @field color? Color
Line = {
    color = DEFAULT_COLORS.YELLOW
}

--- @param color? Color
--- @param left? number distance from left
--- @param top? number distance from top 
--- @param width? number width of element
--- @param height? number width of element
--- @param right? number distance from right
--- @param bottom? number distance from bottom
--- @return Line
function Line.new(color, left, top, width, height, right, bottom)
    --- @type any
    local self = ColoredElement.new(color, left, top, width, height, right, bottom)
    setmetatable(self, {__index = Line})
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
