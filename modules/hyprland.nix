{ config, pkgs, ... }:
{
  programs.hyprland.enable = true; # enable Hyprland

  environment.systemPackages = [
    # ... other packages
    # pkgs.kitty # required for the default Hyprland config
    # pkgs.waybar
    # pkgs.pamixer
    # pkgs.wallust
    # pkgs.font-awesome
    # pkgs.nerdfonts
    # pkgs.swaynotificationcenter
    # pkgs.rofi
    # pkgs.wlogout
    # pkgs.blueman
  ];

  # Optional, hint Electron apps to use Wayland:
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
