local SCRIPT_PATH = debug.getinfo(1, "S").short_src
local DIR_PATH = SCRIPT_PATH:match("(.*\\)")

-- Loading modules.
local MODULES = {
    "graphic\\color.lua",
    "graphic\\scheme.lua",
    "graphic\\element.lua",
}
for i = 1, #MODULES do
    dofile(DIR_PATH .. MODULES[i])
end

-- Graphic.open("")
-- emu.atupdatescreen(Graphic.drawing)
-- -- emu.atinput()
-- emu.atstop(Graphic.close)

