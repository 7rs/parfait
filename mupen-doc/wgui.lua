--- @module "wgui"
local wgui = {}

--- Draws a filled in rectangle at the specified coordinates and color.
--- @param x1 integer
--- @param y1 integer
--- @param x2 integer
--- @param y2 integer
--- @param red number colors range from 0.0 to 1.0
--- @param green number colors range from 0.0 to 1.0
--- @param blue number colors range from 0.0 to 1.0
--- @param alpha number colors range from 0.0 to 1.0 
function wgui.fill_rectangle(x1, y1, x2, y2, red, green, blue, alpha) end

--- Draws the border of a rectangle at the specified coordinates and color.
--- @param x1 integer
--- @param y1 integer
--- @param x2 integer
--- @param y2 integer
--- @param red number colors range from 0.0 to 1.0
--- @param green number colors range from 0.0 to 1.0
--- @param blue number colors range from 0.0 to 1.0
--- @param alpha number colors range from 0.0 to 1.0 
--- @param thickness number
function wgui.draw_rectangle(x1, y1, x2, y2, red, green, blue, alpha, thickness) end

function wgui.fill_rounded_rectangle() end

function wgui.draw_rounded_rectangle() end

--- Draws a filled in ellipse at the specified coordinates and color. 
--- @param x integer
--- @param y integer
--- @param radiusX integer
--- @param radiusY integer
--- @param red number colors range from 0.0 to 1.0
--- @param green number colors range from 0.0 to 1.0
--- @param blue number colors range from 0.0 to 1.0
--- @param alpha number colors range from 0.0 to 1.0 
function wgui.fill_ellipse(x, y, radiusX, radiusY, red, green, blue, alpha) end

function wgui.draw_ellipse() end

function wgui.draw_line() end

function wgui.draw_text() end

function wgui.get_text_size() end

function wgui.push_clip() end

function wgui.pop_clip() end

function wgui.load_image() end

function wgui.free_image() end

function wgui.draw_image() end

function wgui.get_image_info() end

function wgui.set_text_antialias_mode() end

function wgui.set_antialias_mode() end

function wgui.gdip_fillpolygona() end

function wgui.info() end

function wgui.resize() end

return wgui
