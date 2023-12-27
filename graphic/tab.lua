--- @module "tab"
local tab = {}


local colorset = require("graphic.theme.colorset")
local empty = require("graphic.elements.virtual_element")
local background = require("graphic.elements.background")
local element = require("graphic.elements.element")


--- @class Tab: EmptyElement
--- @field theme? any
--- @field background? Background
--- @field elements? table<Element?>
local Tab = {
    colorset = colorset.PARFAIT,
    background = nil,
    elements = {},
}

--- @param color_scheme? any
--- @param left? number distance from left
--- @param top? number distance from top
--- @param width? number width of element
--- @param height? number width of element
--- @param right? number distance from right
--- @param bottom? number distance from bottom
--- @return Tab
function tab.new(color_scheme, left, top, width, height, right, bottom)
    --- @type any
    local self = empty.new(left, top, width, height, right, bottom)

    self.colorset = color_scheme or Tab.colorset
    self.background = background.new(self.colorset.BLACK, nil, self.left, self.top, self.width, self.height)

    setmetatable(self, { __index = Tab })
    return self
end

function Tab:add_element(element)
    table.insert(self.elements,  element)
end

function Tab:delete_element(index)
    table.remove(self.elements, index)
end

function Tab:get_element(index)
    self.elements(index or 1)
end

function Tab:get_elements()
    return self.elements
end

function Tab:draw()
    self.background:draw()
    for i in pairs(self.elements) do
        --- @type Element
        local element = self.elements[i]
        element:draw()
    end
end

return tab
