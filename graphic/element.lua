Element = {
    left = 0,
    top = 0,
    width = 0,
    height = 0,
    right = 0,
    bottom = 0,
}

---@param left? any 0 ~ ? or nil
---@param top? any 0 ~ ? or nil
---@param width? any 0 ~ ? or nil
---@param height? any 0 ~ ? or nil
---@param right? any 0 ~ ? or nil
---@param bottom? any 0 ~ ? or nil
---@return table Element
function Element:new(left, top, width, height, right, bottom)
    if left ~= nil and top ~= nil then
        if width ~= nil and height ~= nil then -- left, top, width, height nil, nil
            right = left + width
            bottom = top + height
        elseif right ~= nil and bottom ~= nil then -- left, top, nil, nil, right, bottom
            width = right - left
            height = bottom - top
        end
    elseif right ~= nil and bottom ~= nil then
        if width ~= nil and height ~= nil then -- nil, nil, width, height, right, bottom
            left = right - width
            top = bottom - height
        end
    end

    local element = {
        left = left or 0,
        top = top or 0,
        width = width or 0,
        height = height or 0,
        right = right or 0,
        bottom = bottom or 0,
    }

    setmetatable(element, self)
    self.__index = self

    return element
end