
set fish_greeting

if set -q ZELLIJ
else
  zellij
end

fish_config theme choose catppuccin_mocha

function fzf --wraps="fzf"
	set -Ux FZF_DEFAULT_OPTS "
		--color=fg:#908caa,bg:#191724,hl:#ebbcba
		--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
		--color=border:#403d52,header:#31748f,gutter:#191724
		--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
		--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
	command fzf
end

set -x ZELLIJ_AUTO_EXIT 1
set -x MANROFFOPT "-c" 
set -x MANPAGER "sh -c 'col -bx | /usr/bin/bat -l man -p'"
set -x BAT_THEME "catppuccin_mocha"
