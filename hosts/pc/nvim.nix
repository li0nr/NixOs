{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.xclip
    pkgs.ripgrep
    pkgs.llvmPackages_19.clang-tools
    pkgs.pyright
    pkgs.lua-language-server
    pkgs.zls
    pkgs.nil
  ];
}
