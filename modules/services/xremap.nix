{ config, pkgs, inputs, ... }:
{
  imports =
  [ inputs.xremap-flake.nixosModules.default ];

  # Keymap for key combo rebinds
  services.xremap.config.keymap = [
    {
      name = "control == alt";
      remap = { "Alt-Backspace"="C-Backspace"; };
      remap = { "Alt-Right"="C-Right"; };
      remap = { "Alt-Left"="C-Left"; }; 
    }
    {
      name = "cross platform sanps";
      remap = { "C-super-enter"="super-up"; };
      remap = { "C-super-h"="super-left"; };
      remap = { "C-super-l"="super-right"; };
      remap = { "C-super-j"="super-down"; };
    #   remap = { "C-super-k"="super-h"; }; 
    }
    {
      name = "normal pasting";
      remap = { "C-v"="C-shift-v"; };
    }
  ];

}
