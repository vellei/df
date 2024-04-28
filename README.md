# Dotfiles

---

## Thessia

- Window Manager: (AwesomeWM)[https://awesomewm.org/]
- Color scheme: (Catppuccin Mocha)[https://github.com/catppuccin/catppuccin]
- Terminal Emulator: (Alacritty)[https://alacritty.org/]
- Terminal Multiplexer: (Zellij)[https://zellij.dev/]
- Text Editor: (Helix)[https://helix-editor.com/]

## Noveria (Wayland or Xorg)

- Window Manager: (Qtile)[https://qtile.org/]

## Aya

- Window Manger: (Hyprland)[https://github.com/hyprwm/Hyprland]

## Illium

---

## How I manage my dotfiles

I've tried a few different ways for managing my dotfiles, and found that I didn't really like any of them. I've written a script that uses `rsync` to copy files. The location for the configs are managed via a json file called `config.json`. `rsync` will only copy files that have been modified, so it's not wasting cycles doing unnecessary I/O.

Git bare repositories are frustrating because they rely heavily on a gitignore to prevent files from being included in commits. It's easy to forget a directory and push something accidentally. In reality, all I really need is a place to work on my dotfiles and way to propagate those changes to my `~/.config` directory. My dots can stay clean with any structure I want and I don't have to do any strange tricks or jump through any hoops for using my dots at the cost of a manual step.

---

## TODO

- [ ] Optional features
  - [ ] extract flag in `config.json`, script should extract when flag is present for config
- [ ] Italics for comments in terminal
