{
  description = "Li0nr's NixOs flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    xremap-flake.url = "github:xremap/nix-flake/master";

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
            ./modules/services/xremap.nix
      ];
    };
  };
}
