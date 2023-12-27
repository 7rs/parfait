--- @module "mutable_text"
local mutable_text = {}

local text = require("graphic.elements.text")
local colorset = require("graphic.theme.colorset")
local fontset = require("graphic.theme.fontset")

--- @class MutableText: Text
--- @field text? string
--- @field func? function
local MutableText = {
    text = "This is a test.",
    func = nil,
}

--- @param color? D2DColor
--- @param left? number distance from left
--- @param top? number distance from top
--- @param width? number width of element
--- @param height? number width of element
--- @param right? number distance from right
--- @param bottom? number distance from bottom
--- @param font? Font
--- @return Text
function mutable_text.new(color, left, top, width, height, right, bottom, font, func)
    --- @type any
    local self = text.new(color, left, top, width, height, right, bottom)
    self.func = func

    setmetatable(self, { __index = MutableText })
    return self
end


--- @return { width: integer, height: integer }
function MutableText:draw()
    local mutable_text = self.func() or self.text

    wgui.draw_text(
        self.left, self.top, self.right, self.bottom,
        self.color.red, self.color.green, self.color.blue, self.color.alpha,
        mutable_text,
        self.font.family, self.font.size, self.font.weight, self.font.style,
        self.font.align, self.font.verticalAlign,
        0 -- idk
    )

    return wgui.get_text_size(mutable_text, self.font.family, self.font.size, self.width, self.height)
end

return mutable_text
