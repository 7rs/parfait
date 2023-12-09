--- @module "element"
local element = {}


--- Checks fields for Element.
--- Available argument combinations are:
---     - left, top, width, height
---     - left, top, right, bottom
---     - right, bottom, width, height
--- Also, negative values for position aren't allowed.
--- @param left? integer distance from left
--- @param top? integer distance from top
--- @param width? integer width of element
--- @param height? integer width of element
--- @param right? integer distance from right
--- @param bottom? integer distance from bottom
local function validate_element_fields(left, top, width, height, right, bottom)
    local negative_value_error_message = "Negative values aren't allowed."
    local incorrect_value_error_message = "An incorrect value is passed."
    local fewer_arugment_error_message = "Passed arguments is fewer than required arguments."

    -- nil check
    if left and top then
        assert((width and height) or (right and bottom), fewer_arugment_error_message)
    elseif right and bottom then
        assert((width and height), fewer_arugment_error_message)
    else
        error(fewer_arugment_error_message)
    end

    -- negative check
    if left and top then
        assert(left >= 0, negative_value_error_message)
        assert(top >= 0, negative_value_error_message)
    end
    if width and height then
        assert(width >= 0, negative_value_error_message)
        assert(height >= 0, negative_value_error_message)
    end
    if right and bottom then
        assert(right >= 0, negative_value_error_message)
        assert(bottom >= 0, negative_value_error_message)
    end

    -- consistency check
    if width and right then
        assert(right - width >= 0, incorrect_value_error_message)
        if left then
            assert(left + width == right, incorrect_value_error_message)
        end
    end
    if height and bottom then
        assert(bottom - height >= 0, incorrect_value_error_message)
        if top then
            assert(top + height == bottom, incorrect_value_error_message)
        end
    end
end

--- A class for all elements.
--- @class Element
--- @field left integer
--- @field top integer
--- @field width integer
--- @field height integer
--- @field right integer
--- @field bottom integer
local Element = {
    left = 0,
    top = 0,
    width = 0,
    height = 0,
    right = 0,
    bottom = 0,
}

--- Generates the element class and returns it.
--- @param left? integer distance from left
--- @param top? integer distance from top
--- @param width? integer width of element
--- @param height? integer width of element
--- @param right? integer distance from right
--- @param bottom? integer distance from bottom
--- @return Element
function element.new(left, top, width, height, right, bottom)
    validate_element_fields(left, top, width, height, right, bottom)

    if left and top then
        if width and height then
            right = left + width
            bottom = top + height
        elseif right and bottom then
            width = right - left
            height = bottom - top
        end
    elseif right and bottom then
        left = right - width
        top = bottom - height
    end

    local self = {
        left = left or 0,
        top = top or 0,
        width = width or 0,
        height = height or 0,
        right = right or 0,
        bottom = bottom or 0,
    }

    setmetatable(self, { __index = Element })
    return self
end

return element
