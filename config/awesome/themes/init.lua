local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local gfs = require("gears.filesystem")
local catppuccin = require("config.colorschemes.catppuccin")
local themes_path = gfs.get_themes_dir()
local dpi = xresources.apply_dpi

local theme = {}

-- Vars
theme.font = "JetBrainsMono Nerd Font 12"
theme.bg_normal = catppuccin.base
theme.bg_focus = catppuccin.surface0
theme.bg_urgent = catppuccin.maroon
theme.bg_minimize = "#444444"
theme.bg_systray = theme.bg_normal
theme.fg_normal = catppuccin.text
theme.fg_focus = catppuccin.text
theme.fg_urgent = catppuccin.text
theme.fg_minimize = catppuccin.text

-- Clients
theme.useless_gap = dpi(8)
theme.border_width = dpi(1)
theme.border_color_normal = catppuccin.surface0
theme.border_color_active = catppuccin.lavender
theme.border_color_marked = catppuccin.red

-- Taglists
theme.taglist_bg = theme.bg_normal
theme.taglist_bg_focus = theme.bg_normal
theme.taglist_bg_occupied = theme.bg_normal
theme.taglist_bg_urgent = theme.bg_normal
theme.taglist_bg_empty = theme.bg_normal
theme.taglist_bg_volatile = theme.bg_normal
theme.taglist_fg = theme.fg_normal
theme.taglist_fg_focus = catppuccin.green
theme.taglist_fg_occupied = theme.fg_normal
theme.taglist_fg_urgent = catppuccin.maroon
theme.taglist_fg_empty = catppuccin.overlay0
theme.taglist_fg_volatile = catppuccin.yellow

-- Hotkeys
theme.hotkeys_bg = theme.bg_normal
theme.hotkeys_fg = theme.fg_normal
theme.hotkeys_border_width = dpi(1)
theme.hotkeys_border_color = catppuccin.rosewater
theme.hotkeys_modifiers_fg = catppuccin.subtext0
theme.hotkeys_font = theme.font
theme.hotkeys_description_font = "Iosevka NF 10"
theme.hotkeys_label_fg = catppuccin.crust
theme.hotkeys_label_bg = catppuccin.peach

-- Notifications
theme.notification_font = theme.font
theme.notification_fg = theme.fg_normal
theme.notification_bg = theme.bg_normal
theme.notification_border_color = catppuccin.subtext1
theme.notification_border_width = dpi(1)

-- Wallpaper
theme.wallpaper = os.getenv("HOME") .. "/.config/images/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating = themes_path .. "default/layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "default/layouts/magnifierw.png"
theme.layout_max = themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "default/layouts/cornersew.png"

theme.icon_theme = nil

-- TODO: Temporary until MPD widget is done
theme.separator_thickness = 0

-- Urgent notifications
rnotification.connect_signal("request::rules", function()
	rnotification.append_rule({
		rule = { urgency = "critical" },
		properties = { bg = catppuccin.maroon, fg = catppuccin.crust },
	})
end)

return theme
