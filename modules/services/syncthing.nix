
{ config, pkgs, ... }:
{
  environment.systemPackages = [
   pkgs.syncthing
  ];

  ## open up ports so other devices can detect the system syncthing 
  networking.firewall.allowedTCPPorts = [ 8384 8386];#[ 8384 22000 ];
  # networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}

