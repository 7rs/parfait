--- @module "display"
local display = {}


--- @class Display
--- @field expand? integer
--- @field width? integer
--- @field height? integer
--- @field resized? boolean
local Display = {
    expand = 0,
    width = 0,
    height = 0,
    resized = false,
}

--- @param expand? integer
--- @param width? integer
--- @param height? integer
--- @return Display
function Display.new(expand, width, height)
    local self = {
        expand = expand or Display.expand,
        width = width or Display.width,
        height = height or Display.height,
    }

    setmetatable(self, { __index = Display })
    return self
end

--- @enum DisplaySizes
local DISPLAY_SIZES = {
    --- 4:3 320×240   QVGA (Quarter VGA)
    --- 4:3 640×480   SD / VGA (Video Graphics Array)
    --- 4:3 800×600   SVGA (Super-VGA)
    --- 4:3 1280×960  QVGA (Quad VGA)
    --- 4:3 1600×1200 UXGA (Ultra XGA)

    -- 4:3            1024×768 XGA (eXtended Graphics Array)
    -- 16:9           1280×720 HD
    -- 683:384 (16:9) 1366×768 FWXGA (Full-WXGA)
    XGA = Display.new(216, 1024, 768),

    -- 4:3  1440×1080 Hi-Vision / HDTV (High Definition television)
    -- 16:9 1920×1080 FHD (Full-HD)
    HDTV = Display.new(216, 1440, 1080),

    -- 4:3  2048×1536 QXGA (Quad-XGA)
    -- 16:9	2560×1440 WQHD (Wide Quad-HD)
    QXGA = Display.new(216, 2048, 1440),

    -- 4:3  3200×2400 QUXGA (Quad UXGA)
    -- 16:9 3840×2160 UHD (Ultra-HD)
    QUXGA = Display.new(216, 2400, 2160),
}


--- @return Display?
local function get_display_info()
    --- @type {width: integer, height: integer}
    local window = wgui.info()

    for k, display_info in pairs(DISPLAY_SIZES) do
        if window.width == display_info.width then
            return display_info
        elseif window.width == display_info.width + display_info.expand then
            display_info.resized = true
            return display_info
        end
    end

    -- lua hasn't continue.
    return
end

--- @param default? boolean
--- @return Display
function display.resize_window(default)
    local display_info = get_display_info()
    if not display_info then
        error("The size isn't supported.")
    end

    if display_info.resized and default then
        wgui.resize(display_info.width, display_info.height)
        return display_info
    end

    wgui.resize(display_info.width + display_info.expand, display_info.height)
    return display_info
end

return display
