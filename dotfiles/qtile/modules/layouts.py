from libqtile import layout
from modules.rules import float_rules

floating_layout = layout.Floating(float_rules)
layouts = [
    layout.Bsp(),
    layout.MonadTall(),
]
