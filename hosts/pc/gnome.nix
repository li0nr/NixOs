{ config, pkgs, ... }:
{
  programs.hyprland.enable = true; # enable Hyprland

  environment.systemPackages = [
    # ... other packages
     pkgs.gnomeExtensions.dash-to-dock
     pkgs.gnomeExtensions.clipboard-history
     pkgs.gnomeExtensions.tactile
     pkgs.gnomeExtensions.blur-my-shell
     pkgs.gnomeExtensions.unite
     pkgs.gnomeExtensions.just-perfection
     pkgs.gnomeExtensions.search-light
     pkgs.gnomeExtensions.wallpaper-slideshow
     pkgs.gnomeExtensions.fuzzy-app-search
     pkgs.gnomeExtensions.logo-menu
     pkgs.gnomeExtensions.switcher
     pkgs.gnome-tweaks
   # pkgs.gnomeExtensions.forge #tiling stuff
  ];

  environment.gnome.excludePackages = with pkgs; [
    orca
    geary
    gnome-maps
    gnome-music
    gnome-tour # GNOME Shell detects the .desktop file on first log-in.
    gnome-user-docs
    gnome-console
    gnome-contacts

    gnome-calendar
    gnome-weather
    # gnome-text-editor
    gnome-calculator
    gnome-characters #cool 
    gnome-backgrounds

    gnome-font-viewer
    gnome-logs

    simple-scan #scan doc app
    snapshot #camera
    yelp
    gnome-software

    # totem #video player app
    # gnome-connections
  ];
}
