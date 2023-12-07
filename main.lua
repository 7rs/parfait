--- Parfait is the fork of SM64 Lua Redux.
--- Forked and Edited by Cbrnex (https://github.com/7rs)
---
--- See:
---     https://github.com/7rs/parfait
---     https://github.com/Mupen64-Rewrite/SM64LuaRedux
--- Also, see:
---     https://github.com/mkdasher/SM64Lua
---


-- Gets current directory path.
local SCRIPT_PATH = debug.getinfo(1, "S").short_src
local DIR_PATH = SCRIPT_PATH:match("(.*\\)")

--- Returns full path for current path.
--- @param subdir string
--- @param module_names table<string>
--- @return table<string>
local function get_module_paths(subdir, module_names)
    for i = 1, #module_names do
        module_names[i] = DIR_PATH .. subdir .. "\\" .. module_names[i]
    end

    return module_names
end

-- Loading modules.
local mods = get_module_paths("graphic", {
    "color.lua",
    "color_scheme.lua",
    "font.lua",
    "font_set.lua",
    "element.lua",
    "shapes.lua",
    "text.lua",
    "tab.lua"
})
for i = 1, #mods do
    dofile(mods[i])
end
