{ config, pkgs, ... }:
{
  environment.systemPackages = [
   pkgs.virt-manager
   pkgs.docker
  ];

  users.groups.libvirtd.members = ["li0nr"];

  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
