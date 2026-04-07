{ ... }: {
  imports = [
    ./hardware-configuration.nix  # Specific to your PC hardware
    ./configuration.nix           # General PC settings (hostname, etc.)
    
    # Machine-specific modules from your original list
    ../../modules/services/keyd.nix
    ../../modules/services/virt.nix
    ../../modules/gnome/gnome.nix
  ];
}
