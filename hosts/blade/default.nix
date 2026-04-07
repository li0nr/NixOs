{ ... }: {
  imports = [
    ./hardware-configuration.nix  # Specific to your PC hardware
    ./configuration.nix           # General PC settings (hostname, etc.)
  ];
}
