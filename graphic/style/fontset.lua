--- @module "fontset"
local fontset = {}

local font = require("graphic.style.font")

--- @class Fontset
--- @field small Font
--- @field medium Font
--- @field large Font
--- @field header Font
local Fontset = {
    small = font.new(nil, nil, nil, nil, font.SMALL),
    normal = font.new(),
    large = font.new(font.BOLD, nil, nil, nil, font.LARGE),
    header = font.new(font.BOLD, nil, nil, nil, font.HEADER),
}

--- @param small Font
--- @param medium Font
--- @param large Font
--- @param header Font
--- @return Fontset
function fontset.new(small, medium, large, header)
    --- @type table
    local self = {
        small = small or Fontset.small,
        medium = medium or Fontset.medium,
        large = large or Fontset.large,
        header = header or Fontset.header,
    }

    --- @type Font
    setmetatable(self, { __index = Fontset })
    return self
end

return fontset
