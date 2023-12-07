--- @enum ExpandWidths
EXPAND_WIDTHS = {
    -- 4:3            1024×768 XGA (eXtended Graphics Array)
    -- 16:9           1280×720 HD
    -- 683:384 (16:9) 1366×768 FWXGA (Full-WXGA)
    XGA = {
        EXPAND_WIDTH = 216,
        WIDTH = 1024,
        HEIGHT = 768,
    },

    -- 4:3  1440×1080 Hi-Vision / HDTV (High Definition television)
    -- 16:9 1920×1080 FHD (Full-HD)
    HDTV = {
        EXPAND_WIDTH = 216,
        WIDTH = 1440,
        HEIGHT = 1080,
    },

    -- 4:3  2048×1536 QXGA (Quad-XGA)
    -- 16:9	2560×1440 WQHD (Wide Quad-HD)
    QXGA = {
        EXPAND_WIDTH = 216,
        WIDTH = 2048,
        HEIGHT = 1440,
    },

    -- 4:3  3200×2400 QUXGA (Quad UXGA)
    -- 16:9 3840×2160 UHD (Ultra-HD)
    QUXGA = {
        EXPAND_WIDTH = 216,
        WIDTH = 2400,
        HEIGHT = 2160,
    },
}

--- @class Tab
Tab = {
    expand_width = EXPAND_WIDTHS.XGA.EXPAND_WIDTH,
}

local function resize()
    local window = wgui.info()

    if window.width == EXPAND_WIDTHS.XGA.WIDTH then
        wgui.resize(
            EXPAND_WIDTHS.XGA.WIDTH + EXPAND_WIDTHS.XGA.EXPAND_WIDTH,
            EXPAND_WIDTHS.XGA.HEIGHT
        )
    elseif window.width == EXPAND_WIDTHS.HDTV.WIDTH then
        wgui.resize(
            EXPAND_WIDTHS.HDTV.WIDTH + EXPAND_WIDTHS.HDTV.EXPAND_WIDTH,
            EXPAND_WIDTHS.HDTV.HEIGHT
        )
    elseif window.width == EXPAND_WIDTHS.QXGA.WIDTH then
        wgui.resize(
            EXPAND_WIDTHS.QXGA.WIDTH + EXPAND_WIDTHS.QXGA.EXPAND_WIDTH,
            EXPAND_WIDTHS.QXGA.HEIGHT
        )
    elseif window.width == EXPAND_WIDTHS.QUXGA.WIDTH then
        wgui.resize(
            EXPAND_WIDTHS.QUXGA.WIDTH + EXPAND_WIDTHS.QUXGA.EXPAND_WIDTH,
            EXPAND_WIDTHS.QUXGA.HEIGHT
        )
    else
        if window.width == EXPAND_WIDTHS.XGA.WIDTH + EXPAND_WIDTHS.XGA.EXPAND_WIDTH then
            wgui.resize(
                EXPAND_WIDTHS.XGA.WIDTH,
                EXPAND_WIDTHS.XGA.HEIGHT
            )
        elseif window.width == EXPAND_WIDTHS.HDTV.WIDTH + EXPAND_WIDTHS.XGA.EXPAND_WIDTH then
            wgui.resize(
                EXPAND_WIDTHS.HDTV.WIDTH,
                EXPAND_WIDTHS.HDTV.HEIGHT
            )
        elseif window.width == EXPAND_WIDTHS.QXGA.WIDTH + EXPAND_WIDTHS.XGA.EXPAND_WIDTH then
            wgui.resize(
                EXPAND_WIDTHS.QXGA.WIDTH,
                EXPAND_WIDTHS.QXGA.HEIGHT
            )
        elseif window.width == EXPAND_WIDTHS.QUXGA.WIDTH + EXPAND_WIDTHS.XGA.EXPAND_WIDTH then
            wgui.resize(
                EXPAND_WIDTHS.QUXGA.WIDTH,
                EXPAND_WIDTHS.QUXGA.HEIGHT
            )
        end
    end
end

---@param color? table
function Tab.new(color)
    -- local window = wgui.info()

    -- if window.width <= 1024 then
    --     Window.width = window.width
    --     Window.height = window.height
    --     wgui.resize(window.width + Page.expandWidth, window.height)
    -- end

    -- local page = Rectangle:new(
    --     Window.width, 0, Window.width + Page.expandWidth, Window.height,
    --     nil, nil, color or self.color
    -- )

    -- setmetatable(page, { __index = self })
    -- return page
end
