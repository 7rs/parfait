--- Parfait is the fork of SM64 Lua Redux.
--- Forked and Edited by Cbrnex (https://github.com/7rs)
---
--- See:
---     https://github.com/7rs/parfait
---     https://github.com/Mupen64-Rewrite/SM64LuaRedux
--- Also, see:
---     https://github.com/mkdasher/SM64Lua
---

local function add_lua_path(path)
    package.path = package.path .. string.format(";%s?.lua", path)
    package.cpath = package.cpath .. string.format(";%s?.dll", path)
    package.cpath = package.cpath .. string.format(";%s?.?dll", path)

    print(string.format("Add the path (%s) to package.path and package.cpath", path))
end

local function get_mupen_version()
    if emu.set_renderer then
        return "1.1.4+"
    elseif wgui.fill_rectangle then
        return "1.1.3"
    else
        return "1.1.2?"
    end
end

local SCRIPT_PATH = debug.getinfo(1, "S").short_src
local DIR_PATH = SCRIPT_PATH:match("(.*\\)")

add_lua_path(DIR_PATH)

local colorset = require("graphic.theme.colorset")
local display = require("graphic.display")
local tab = require("graphic.tab")
local element = require("graphic.elements.element")
local mutable_text = require("graphic.elements.mutable_text")


print("Parfait (https://github.com/7rs/parfait)")
print(string.format("Lua Version: %s", _VERSION))
print(string.format("Mupen Version: %s", get_mupen_version()))
print()

-- wgui
-- input
-- savestate
-- avi
-- iohelper
-- movie
-- joypad
-- memory
-- emu

for k, v in pairs(wgui) do
    print(k)
end

local function setTab()
    local display_info = display.resize_window()
    Main = tab.new(colorset.DRACULA, display_info.width, 0, display_info.expand, display_info.height)
    Main:add_element(element.new(
        element.ELEMENT_TYPES.TEXT,
        mutable_text.new(colorset.DRACULA.WHITE, Main.left, 30, 100, 50, nil, nil, nil, function()
            return "" .. memory.readdword(0x00B3B17C)
        end)
    ))

    return Main
end

Main = setTab()
emu.atupdatescreen(function() Main:draw() end)
emu.atstop(function() display.resize_window(true) end)
