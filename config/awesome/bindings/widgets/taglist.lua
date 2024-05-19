local awful = require("awful")

return {
	buttons = {
		awful.button({
			modifiers = {},
			button = 1,
			on_press = function(t)
				t:view_only()
			end,
		}),
	},
}
