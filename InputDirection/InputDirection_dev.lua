-- Input Direction Lua Script v3.5
-- Author: MKDasher
-- Hacker: Eddio0141
-- Special thanks to Pannenkoek2012 and Peter Fedak for angle calculation support.
-- Also thanks to MKDasher to making the code very clean
-- Other contributors:
--	Madghostek, Xander, galoomba, ShadoXFM, Lemon, Manama, tjk

function folder(thisFileName)
    local str = debug.getinfo(2, 'S').source:sub(2)
    return (str:match('^.*/(.*).lua$') or str):sub(1, -(thisFileName):len() - 1)
end

PATH = debug.getinfo(1).source:sub(2):match("(.*\\)") .. "\\InputDirection_dev\\"
CURRENT_PATH = debug.getinfo(1).source:sub(2):match("(.*\\)") .. "\\"

dofile(CURRENT_PATH .. "mupen-lua-ugui.lua")
dofile(CURRENT_PATH .. "nineslice.lua")
dofile(PATH .. "Drawing.lua")
Drawing.resizeScreen()

dofile(PATH .. "Memory.lua")
dofile(PATH .. "Settings.lua")
dofile(PATH .. "Joypad.lua")
dofile(PATH .. "Angles.lua")
dofile(PATH .. "Engine.lua")
dofile(PATH .. "Buttons.lua")
dofile(PATH .. "Input.lua")
dofile(PATH .. "Program.lua")
dofile(PATH .. "MoreMaths.lua")
dofile(PATH .. "Actions.lua")
dofile(PATH .. "Swimming.lua")
dofile(PATH .. "RNGToIndex.lua")
dofile(PATH .. "IndexToRNG.lua")
dofile(PATH .. "recordghost.lua")

Settings.VisualStyle = "windows-aero"
Settings.ShowEffectiveAngles = false -- show angles floored to the nearest multiple of 16

Program.initFrame()
Memory.UpdatePrevPos()
function main()
    Program.initFrame()
    Program.main()
    Program.rngSetter()
    Joypad.send()
    Swimming.swim("A")

    if recording_ghost then
        Ghost.main()
    end
end

function drawing()
    section_name_path = folder('InputDirection_dev.lua') .. 'res\\' .. Settings.VisualStyle
    if not ustyles[section_name_path .. '.ustyles'] then
        ustyles[section_name_path .. '.ustyles'] = parse_ustyles(section_name_path .. '.ustyles')
    end

    local keys = input.get()
    Mupen_lua_ugui.begin_frame(BreitbandGraphics.renderers.d2d, Mupen_lua_ugui.stylers.windows_10, {
        pointer = {
            position = {
                x = keys.xmouse,
                y = keys.ymouse,
            },
            is_primary_down = keys.leftclick,
        },
        keyboard = {
            held_keys = keys,
        },
    })

    Drawing.paint()
    Input.update()
end

function close()
    Drawing.UnResizeScreen()
end

emu.atinput(main)
emu.atupdatescreen(drawing)
emu.atstop(close)
if emu.atloadstate then
    emu.atloadstate(drawing, false)
    emu.atreset(Drawing.resizeScreen, false)
else
    print("update ur mupen")
end
