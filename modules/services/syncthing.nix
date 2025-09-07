
{ config, pkgs, ... }:
{
  environment.systemPackages = [
   pkgs.syncthing
  ];

  services.syncthing = {
    enable = true;
    openDefaultPorts = true; # Open ports in the firewall for Syncthing
  };
  ## open up ports so other devices can detect the system syncthing 
  # networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  # networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}

