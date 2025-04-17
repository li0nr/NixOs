{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.xclip
    pkgs.ripgrep

    # LSPs
    pkgs.llvmPackages_19.clang-tools
    pkgs.pyright
    pkgs.lua-language-server
    pkgs.zls
    pkgs.nil
  ];
}
