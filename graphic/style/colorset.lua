--- This module provides color presets.
--- @module "colorset"
local colorset = {}


local d2dcolor = require("graphic.style.d2dcolor")


--- @class Colorset
--- @field black? D2DColor
--- @field gray? D2DColor
--- @field white? D2DColor
--- @field pink? D2DColor
--- @field red? D2DColor
--- @field orange? D2DColor
--- @field yellow? D2DColor
--- @field green? D2DColor
--- @field cyan? D2DColor
--- @field blue? D2DColor
--- @field purple? D2DColor
local Colorset = {
    black = d2dcolor.new("#202040"),
    gray = d2dcolor.new("#606080"),
    white = d2dcolor.new("#F0F0FF"),
    pink = d2dcolor.new("#FFD0D0"),
    red = d2dcolor.new("#FF8080"),
    orange = d2dcolor.new("#FFA060"),
    yellow = d2dcolor.new("#F0FF80"),
    green = d2dcolor.new("#60FF60"),
    cyan = d2dcolor.new("#A0E0FF"),
    blue = d2dcolor.new("#6060FF"),
    purple = d2dcolor.new("#D080FF"),
}

--- @param black? D2DColor
--- @param gray? D2DColor
--- @param white? D2DColor
--- @param pink? D2DColor
--- @param red? D2DColor
--- @param orange? D2DColor
--- @param yellow? D2DColor
--- @param green? D2DColor
--- @param cyan? D2DColor
--- @param blue? D2DColor
--- @param purple? D2DColor
--- @return Colorset
function colorset.new(black, gray, white, pink, red, orange, yellow, green, cyan, blue, purple)
    --- @type table
    local self = {
        black = black or Colorset.black,
        gray = gray or Colorset.gray,
        white = white or Colorset.white,
        pink = pink or Colorset.pink,
        red = red or Colorset.red,
        orange = orange or Colorset.orange,
        yellow = yellow or Colorset.yellow,
        green = green or Colorset.green,
        cyan = cyan or Colorset.cyan,
        blue = blue or Colorset.blue,
        purple = purple or Colorset.purple,
    }

    --- @type Colorset
    setmetatable(self, { __index = Colorset })
    return self
end

return colorset
