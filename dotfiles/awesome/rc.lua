-- awesome_mode: api-level=4:screen=on
local beautiful = require("beautiful")
local gears = require("gears")
beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/init.lua")

require("bindings")
require("rules")
require("signals")
