set fish_greeting

if set -q ZELLIJ
else
  zellij
end

fish_config theme choose catppuccin_mocha

set -x ZELLIJ_AUTO_EXIT 1
set -x MANROFFOPT "-c" 
set -x MANPAGER "sh -c 'col -bx | /usr/bin/bat -l man -p'"
set -x BAT_THEME "catppuccin_mocha"


set -x VISUAL hx
set -x PAGER bat
