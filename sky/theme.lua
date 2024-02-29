-------------------------------
--    "Sky" awesome theme    --
--  By Andrei "Garoth" Thorp --
-------------------------------
-- If you want SVGs and extras, get them from garoth.com/awesome/sky-theme

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local themes_path = require("gears.filesystem").get_themes_dir()


-- BASICS
local theme = {}
theme.font          = "monospace 12"

theme.bg_focus      = "#000000"
theme.bg_normal     = "#2D2331"
theme.bg_urgent     = "#fce94f"
theme.bg_minimize   = "#2D2331"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#FFFFFF"
theme.fg_focus      = "#23FF3E"
theme.fg_urgent     = "#2e3436"
theme.fg_minimize   = "#FFFFFF"

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(2)
theme.border_color_normal = "#52096E"
theme.border_color_active = "#A00FD7"
theme.border_color_marked = "#52096E"

-- IMAGES
theme.layout_fairh           = themes_path .. "sky/layouts/fairh.png"
theme.layout_fairv           = themes_path .. "sky/layouts/fairv.png"
theme.layout_floating        = themes_path .. "sky/layouts/floating.png"
theme.layout_magnifier       = themes_path .. "sky/layouts/magnifier.png"
theme.layout_max             = themes_path .. "sky/layouts/max.png"
theme.layout_fullscreen      = themes_path .. "sky/layouts/fullscreen.png"
theme.layout_tilebottom      = themes_path .. "sky/layouts/tilebottom.png"
theme.layout_tileleft        = themes_path .. "sky/layouts/tileleft.png"
theme.layout_tile            = themes_path .. "sky/layouts/tile.png"
theme.layout_tiletop         = themes_path .. "sky/layouts/tiletop.png"
theme.layout_spiral          = themes_path .. "sky/layouts/spiral.png"
theme.layout_dwindle         = themes_path .. "sky/layouts/dwindle.png"
theme.layout_cornernw        = themes_path .. "sky/layouts/cornernw.png"
theme.layout_cornerne        = themes_path .. "sky/layouts/cornerne.png"
theme.layout_cornersw        = themes_path .. "sky/layouts/cornersw.png"
theme.layout_cornerse        = themes_path .. "sky/layouts/cornerse.png"

--{{{   ****Icons****
theme.awesome_icon           = "~/.config/awesome/sky/kindredIcon.jpg"
theme.terminalIcon           = "~/.config/awesome/sky/icons/Alacritty_logo.png"
theme.browserIcon            = "~/.config/awesome/sky/icons/browser.png"
-- from default for now...
theme.menu_submenu_icon     = themes_path .. "default/submenu.png"
--  }}
-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- MISC
theme.wallpaper             = "~/.config/awesome/sky/nightcityrainy.jpg"
theme.taglist_squares       = "true"
theme.titlebar_close_button = "true"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)


-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#dd6060', fg = '#ffffff' }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
