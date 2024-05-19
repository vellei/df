local _M = {
	terminal = os.getenv("TERMINAL") or "alacritty",
	editor = os.getenv("EDITOR") or "helix",
	browser = "firefox",
	music = "ncmpcpp",
	file = "ranger",
}

_M.editor_cmd = _M.terminal .. " start " .. _M.editor
_M.manual_cmd = _M.terminal .. " start man awesome"
_M.music_cmd = _M.terminal .. " start " .. _M.music
_M.file_cmd = _M.terminal .. " start " .. _M.file

return _M
