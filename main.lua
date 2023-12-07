local SCRIPT_PATH = debug.getinfo(1, "S").short_src
local DIR_PATH = SCRIPT_PATH:match("(.*\\)")

-- Loading modules.
local MODULES = {
    "graphic\\color.lua",
    "graphic\\scheme.lua",
    "graphic\\element.lua",
    "graphic\\shapes.lua",
    "graphic\\font.lua",
    "graphic\\text.lua",
}
for i = 1, #MODULES do
    dofile(DIR_PATH .. MODULES[i])
end

print(Rectangle.new(DEFAULT_COLORS.CYAN, 1024, 10, 100, 30))
