--- This module provides virtual elements that controls elements.  <br/>
--- It also has no substance.
--- @module "virtual"
local virtual = {}


---This enum used by validate_element_fields.
--- @enum ErrorMessages
ERROR_MESSAGES = {
    NEGATIVE_VALUE = "Negative values aren't allowed.",
    INCORRECT_VALUE = "An incorrect value is passed.",
    FEWER_ARUGMENT = "Passed arguments is fewer than required arguments.",
}

--- This function validates the fields of elements.
--- @param left? integer
--- @param top? integer
--- @param width? integer
--- @param height? integer
--- @param right? integer
--- @param bottom? integer
local function validate_element_fields(left, top, width, height, right, bottom)
    -- Validates if the required arguments were given.
    if left and top then
        assert((width and height) or (right and bottom), ERROR_MESSAGES.FEWER_ARUGMENT)
    elseif right and bottom then
        assert((width and height), ERROR_MESSAGES.FEWER_ARUGMENT)
    else
        error(ERROR_MESSAGES.FEWER_ARUGMENT)
    end

    -- Validates if the argumernts aren't negative.
    if left and top then
        assert(left >= 0, ERROR_MESSAGES.NEGATIVE_VALUE)
        assert(top >= 0, ERROR_MESSAGES.NEGATIVE_VALUE)
    end
    if width and height then
        assert(width >= 0, ERROR_MESSAGES.NEGATIVE_VALUE)
        assert(height >= 0, ERROR_MESSAGES.NEGATIVE_VALUE)
    end
    if right and bottom then
        assert(right >= 0, ERROR_MESSAGES.NEGATIVE_VALUE)
        assert(bottom >= 0, ERROR_MESSAGES.NEGATIVE_VALUE)
    end

    -- Validates if the arguments are correct.
    if width and right then
        assert(right - width >= 0, ERROR_MESSAGES.INCORRECT_VALUE)
        if left then
            assert(left + width == right, ERROR_MESSAGES.INCORRECT_VALUE)
        end
    end
    if height and bottom then
        assert(bottom - height >= 0, ERROR_MESSAGES.INCORRECT_VALUE)
        if top then
            assert(top + height == bottom, ERROR_MESSAGES.INCORRECT_VALUE)
        end
    end
end

--- This is a virtual element.  <br/>
--- Virtual elements control elements in one of two ways:  <br/>
---   It inherited by elements.  <br/>
---   It controls some elements within a range uniformly.  <br/>
--- @class VirtualElement
--- @field left integer
--- @field top integer
--- @field width integer
--- @field height integer
--- @field right integer
--- @field bottom integer
local VirtualElement = {
    left = 0,
    top = 0,
    width = 0,
    height = 0,
    right = 0,
    bottom = 0,
}

--- This function generates a virtual element and returns it.  <br/>
--- Available arguments combinations are:  <br/>
---     - left, top, width, height  <br/>
---     - left, top, right, bottom  <br/>
---     - right, bottom, width, height  <br/>
--- Also, you can't specify a negative value as an argument.
--- @param left? integer Distance from the left edge of the window. You can't specify it greater than `right`.
--- @param top? integer Distance from the top edge of the window. You can't specify it greater than `bottom`.
--- @param width? integer Width of the element.
--- @param height? integer Height of the element.
--- @param right? integer Distance from the right edge of the window. You can't specify it less than `left`.
--- @param bottom? integer Distance from the bottom edge of the window. You can't specify it less than `top`.
--- @return VirtualElement
function virtual.new(left, top, width, height, right, bottom)
    validate_element_fields(left, top, width, height, right, bottom)

    if left and top and width and height then
        right = left + width
        bottom = top + height
    elseif left and top and right and bottom then
        width = right - left
        height = bottom - top
    elseif right and bottom and width and height then
        left = right - width
        top = bottom - height
    end

    -- Checks if the arguments aren't nil.
    --- @type table
    local self = {
        left = left or VirtualElement.left,
        top = top or VirtualElement.top,
        width = width or VirtualElement.width,
        height = height or VirtualElement.height,
        right = right or VirtualElement.right,
        bottom = bottom or VirtualElement.bottom,
    }

    --- @type VirtualElement
    setmetatable(self, { __index = VirtualElement })
    return self
end

function VirtualElement:draw()
end

return virtual
