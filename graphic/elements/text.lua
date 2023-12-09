--- @module "text"
local text = {}


local d2dcolor = require("graphic.theme.d2dcolor")
local colorset = require("graphic.theme.colorset")
local colored_element = require("graphic.elements.colored_element")


--- @class Text: ColoredElement
local Text = {
    font = colorset.PARFAIT.NORMAL,
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
function text.new(color, left, top, width, height, right, bottom, font)
    --- @type any
    local self = colored_element.new(color, left, top, width, height, right, bottom)
    self.font = font or Text.font

    setmetatable(self, { __index = Text })
    return self
end

--- @param text string
--- @return { width: integer, height: integer }
function Text:draw(text)
    wgui.draw_text(
        self.left, self.top, self.right, self.bottom,
        self.color.red, self.color.green, self.color.blue, self.color.alpha,
        text,
        self.font.family, self.font.size, self.font.weight, self.font.style,
        self.font.align, self.font.verticalAlign,
        0 -- idk
    )

    return wgui.get_text_size(text, self.font.family, self.font.size, self.width, self.height)
end

return text
