--- This module provides the elements with a color property.  <br/>
--- It isn't used directly but is inherited by elements that require a color property.
--- @module "colored"
local colored = {}


local virtual = require("graphic.element.virtual")
local colorset = require("graphic.style.colorset")


--- This is a colored element.
--- @class ColoredElement: VirtualElement
--- @field color? D2DColor
local ColoredElement = {
    color = colorset.PARFAIT.PINK,
}

--- This function generates a colored element and returns it.  <br/>
--- About the arguments, refer to `virtual.new` and `d2dcolor.new`.
--- @param color? D2DColor
--- @param left? integer
--- @param top? integer
--- @param width? integer
--- @param height? integer
--- @param right? integer
--- @param bottom? integer
--- @return ColoredElement
function colored.new(color, left, top, width, height, right, bottom)
    --- @type table
    local self = virtual.new(left, top, width, height, right, bottom)
    self.color = color

    --- @type ColoredElement
    setmetatable(self, { __index = ColoredElement })
    return self
end

return colored
