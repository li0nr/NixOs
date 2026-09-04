{ pkgs, ... }: {
  # 1. Shared Modules
  imports = [
    ./nvim.nix
    ./services/syncthing.nix
  ];

  # 2. System-wide Packages (the basics)
  environment.systemPackages = with pkgs; [
    git
    htop
    neovim
    bash
    zsh
    atuin
    lazygit
    fzf
    tmux
    zoxide
    netbird
    stow
  ];

  # 3. Basic System Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enable flakes globally
  time.timeZone = "Asia/Jerusalem"; # Change to your timezone
  i18n.defaultLocale = "en_IL";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  nixpkgs.config.allowUnfree = true;

  # 4. Shared User Account
  users.users.li0nr = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Admin rights
    # openssh.authorizedKeys.keys = [ "ssh-ed25519 ..." ]; # Add your SSH key here
  };
}

