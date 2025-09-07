
{ config, pkgs, inputs, ... }:
{
  systemd.timers."rclone-down" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "30sec";
      OnUnitActiveSec = "1h";
      Unit = "rclone-down.service";
    };
  };

  systemd.services."rclone-down" = {
    script = ''
      set -eu
      /run/current-system/sw/bin/bash /home/li0nr/Nix/modules/services/aux/rclone_down.sh
      '';
    serviceConfig = {
      Type = "oneshot";
      User = "li0nr";
    };
  };


  systemd.timers."rclone-up" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "20m";
      Unit = "rclone-up.service";
    };
  };

  systemd.services."rclone-up" = {
    script = ''
      set -eu
      /run/current-system/sw/bin/bash /home/li0nr/Nix/modules/services/aux/rclone_up.sh
      '';
    serviceConfig = {
      Type = "oneshot";
      User = "li0nr";
    };
  };
}
