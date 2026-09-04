{ pkgs, ... }:

let
  rcloneBisync = pkgs.writeShellApplication {
    name = "rclone-bisync";
    runtimeInputs = [ pkgs.coreutils pkgs.rclone ];
    text = ''
      state_dir=/home/li0nr/.local/state/rclone-bisync
      mkdir -p "$state_dir"

      for folder in Knowledge-Vault WallPapers Papers Books; do
        local_path="/home/li0nr/GoogleDrive/$folder"
        marker="$state_dir/$folder.initialized"
        mkdir -p "$local_path"

        args=(
          bisync "drive-own:$folder" "$local_path"
          --create-empty-src-dirs
          --resilient
          --recover
          --max-lock 2m
          --max-delete 25
          --conflict-resolve newer
          --verbose
        )

        if [[ -e "$marker" ]]; then
          rclone "''${args[@]}"
        else
          rclone "''${args[@]}" --resync-mode newer
          touch "$marker"
        fi
      done
    '';
  };
in
{
  systemd.services.rclone-bisync = {
    description = "Bidirectional Google Drive sync";
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];
    serviceConfig = {
      Type = "oneshot";
      User = "li0nr";
      Environment = [
        "HOME=/home/li0nr"
        "XDG_CACHE_HOME=/home/li0nr/.cache"
      ];
      ExecStart = "${rcloneBisync}/bin/rclone-bisync";
      KillSignal = "SIGINT";
      TimeoutStopSec = "2min";
    };
  };

  systemd.timers.rclone-bisync = {
    description = "Run Google Drive bisync every five minutes";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "2m";
      OnUnitInactiveSec = "5m";
      Persistent = true;
      RandomizedDelaySec = "30s";
      Unit = "rclone-bisync.service";
    };
  };
}
