{
  description = "Li0nr's NixOs flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05"; # update version
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; # Unstable

  };

  outputs = { nixpkgs, nixpkgs-unstable, ... } @ inputs:
    let
      # Helper function to reduce boilerplate
      mkHost = host: nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ 
          ./modules/common.nix  # Everything shared (nvim, syncthing, etc)
          ./hosts/${host}       # The specific machine folder
        ];
      };
    in {
      nixosConfigurations = {
        pc  	= mkHost "pc";
        blade   = mkHost "blade";
        # laptop = mkHost "laptop"; # Adding a new one is now this easy
      };
    };
}
