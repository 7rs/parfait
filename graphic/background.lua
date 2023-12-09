--- @module "background"
local background = {}


local d2dcolor = require("graphic.theme.d2dcolor")
local colorset = require("graphic.theme.colorset")
local element = require("graphic.elements.element")
local rectangle = require("graphic.elements.rectangle")


--- @class Background
--- @field color? D2DColor
--- @field image? any
--- @field rectangle? Rectangle
local Background = {
    color = colorset.PARFAIT.BLACK,
    rectangle = nil,
    image = nil,
}

--- @param color? D2DColor
--- @param image? any
--- @param left? number distance from left
--- @param top? number distance from top
--- @param width? number width of element
--- @param height? number width of element
--- @param right? number distance from right
--- @param bottom? number distance from bottom
--- @return Background
function background.new(color, image, left, top, width, height, right, bottom)
    --- @type any
    local self = element.new(left, top, width, height, right, bottom)

    if color then
        if color.alpha <= 0 or d2dcolor.is_black(color) then
            self.color = nil
        else
            self.color = color
        end
    end

    --- @type {width: integer, height: integer}
    self.rectangle = rectangle.new(self.color, self.left, self.top, self.width, self.height)

    if image then
    end

    setmetatable(self, { __index = Background })
    return self
end

function Background:draw()
    if self.color and self.rectangle then
        self.rectangle:fill()
    end

    if self.image then
    end
end

return background
