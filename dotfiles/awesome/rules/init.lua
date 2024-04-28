local awful = require("awful")
local ruled = require("ruled")

ruled.client.connect_signal("request::rules", function()
	-- All clients will match this rule.
	ruled.client.append_rule({
		id = "global",
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	})

	-- Floating clients.
	-- Empty now, but may come back to this later
	-- ruled.client.append_rule({
	--   id = "floating",
	--   rule_any = {
	--     instance = {},
	--     class = {},
	--     name = {},
	--     role = {},
	--   },
	--   properties = { floating = true },
	-- })

	-- Remove titlebars from normal and dialog clients
	ruled.client.append_rule({
		id = "titlebars",
		rule_any = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = false },
	})

	ruled.client.append_rule({
		rule = { class = "Music" },
		properties = { screen = 1, tag = "5" },
	})

	-- If you restart/power off your computer while Firefox is
	-- maximized, then it will be stuck that way. This should
	-- fix it after a reboot. Make sure all Firefox windows are
	-- closed first
	ruled.client.append_rule({
		rule = { class = "Firefox" },
		properties = { maximized = false, floating = false }
	})
end)
