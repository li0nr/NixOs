{ config, pkgs, ... }:
{
  # programs.hyprland.enable = true; # enable Hyprland

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.accounts-daemon.enable = true;
  services.gnome.gnome-online-accounts.enable = true;

  environment.systemPackages = [
    # ... other packages
     pkgs.gnomeExtensions.clipboard-history
     pkgs.gnomeExtensions.gtile # tiling or snapping
     pkgs.gnomeExtensions.search-light # app launcher
     pkgs.gnomeExtensions.fuzzy-app-search
     pkgs.gnome-tweaks
     # visuals
     pkgs.gnomeExtensions.top-bar-organizer
     pkgs.gnomeExtensions.just-perfection # also top bar stuff
     pkgs.gnomeExtensions.wallpaper-slideshow
     pkgs.gnomeExtensions.unite # top bar stuff
     pkgs.gnomeExtensions.dash-to-dock # dock stuff also visual
     pkgs.gnomeExtensions.blur-my-shell
     pkgs.gnomeExtensions.logo-menu
     # pkgs.gnomeExtensions.switcher
     # tiling stuff currently using gtile
     # pkgs.gnomeExtensions.tactile
     # pkgs.gnomeExtensions.forge 
     # pkgs.gnomeExtensions.quick-settings-tweaker
     # pkgs.google-drive-ocamlfuse
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
