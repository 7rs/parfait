--- @module "element"
local element = {}


--- @enum ElementTypes
element.ELEMENT_TYPES = {
    EMPTY = 0,
    COLORED = 100,
    RECT_ANGLE = 200,
    FILLED_RECTANGLE = 201,
    BACKGROUND = 202,

    ELLIPSE = 300,
    FILLED_ELLIPSE = 301,

    LINE = 500,

    TEXT = 600,

    IMAGE = 700,

    SINGLE_BUTTON = 800,
    RADIO_BUTTON = 801,
    MULTI_BUTTON = 802,
    INPUT_BOX = 803,
}

--- @class Element
--- @field elementType? ElementTypes
--- @field elementObject? any
--- @field background? Background
--- @field font? Font
--- @field thickness? integer
local Element = {}

function element.new(elementType, elementObject, background, font, thickness)
    local self = {
        elementType = elementType,
        elementObject = elementObject,
        background = background,
        font = font,
        thickness = thickness,
    }

    setmetatable(self, {__index = Element})
    return self
end

function Element:draw()
    if self.elementType == element.ELEMENT_TYPES.RECT_ANGLE then
        self.elementObject:draw(self.thickness)
    elseif self.elementType == element.ELEMENT_TYPES.FILLED_RECTANGLE then
        self.elementObject:fill()
    elseif self.elementType == element.ELEMENT_TYPES.ELLIPSE then
        self.elementObject:draw(self.thickness)
    elseif self.elementType == element.ELEMENT_TYPES.FILLED_ELLIPSE then
        self.elementObject:draw(self.thickness)
    elseif self.elementType == element.ELEMENT_TYPES.LINE then
        self.elementObject:draw(self.thickness)
    elseif self.elementType == element.ELEMENT_TYPES.BACKGROUND then
        self.elementObject:draw()
    elseif self.elementType == element.ELEMENT_TYPES.TEXT then
        self.elementObject:draw()
    end
end

return element
