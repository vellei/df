{ config, lib, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "thanatos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.johann = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    packages = with pkgs; [

      # Core dependencies
      amdvlk
      hyprland
      mesa
      wayland

      # Development
      docker
      git
      gitui
      helix
      zellij

      # CLI Tools
      bat
      eza
      fd
      fish
      fzf
      glow
      jq
      libarchive
      ranger
      ripgrep
      rsync
      skim

      # Desktop
      alacritty
      bemenu
      firefox
      font-awesome
      hyprpaper
      nerdfonts

      # Entertainment
      mpd
      mpv
      ncmpcpp
      pyradio
    ];
  };

  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    vim
  ];

  # nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05"; # Did you read the comment?

}

