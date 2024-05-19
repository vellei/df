local awful = require("awful")
local wibox = require("wibox")

local taglist = require("widgets.wibar.taglist")
local layoutbox = require("widgets.wibar.layoutbox")

return function(s)
    s.widgets = {
        layoutbox = layoutbox(s),
        taglist = taglist(s),
        promptbox = awful.widget.prompt(),
        systray = wibox.widget.systray(),
        textclock = wibox.widget.textclock(),
    }

    s.widgets.wibar = awful.wibar({
        screen = s,
        position = "top",
        widget = {
            layout = wibox.layout.align.horizontal,
            {
                layout = wibox.layout.fixed.horizontal,
                s.widgets.taglist,
                s.widgets.promptbox,
            },
            { layout = wibox.layout.fixed.horizontal, wibox.widget.separator() },
            {
                layout = wibox.layout.fixed.horizontal,
                s.widgets.systray,
                s.widgets.textclock,
                s.widgets.layoutbox,
            },
        },
    })
end
