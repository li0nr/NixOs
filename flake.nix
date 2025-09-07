{
  description = "Li0nr's NixOs flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05"; # update version

    # xremap-flake.url = "github:xremap/nix-flake/master";

  };

  outputs = {nixpkgs, ... } @inputs:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;     
  in

  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
            ./hosts/pc/configuration.nix
            # ./modules/services/xremap.nix
            ./modules/services/keyd.nix
            ./modules/services/virt.nix
            ./modules/services/syncthing.nix
            ./modules/nvim.nix
            ./modules/gnome/gnome.nix
      ];
    };
  };
}
