from modules.keybindings import keys, mouse
from modules.screens import screens
from modules.options import widget_defaults
from modules.layouts import layouts, floating_layout
import modules.hooks

extension_defaults = widget_defaults.copy()
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
disable_drag = True

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "LG3D"
