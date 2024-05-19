local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")

client.connect_signal("mouse::enter", function(c)
	c:activate({ context = "mouse_enter", raise = false })
end)

client.connect_signal("property::floating", function(c)
	if c.floating then
		c.optop = true
	else
		c.ontop = false
	end
end)
