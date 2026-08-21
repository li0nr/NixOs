{ ... }: {
  imports = [
    ./hardware-configuration.nix  # Specific to your PC hardware
    ./configuration.nix           # General PC settings (hostname, etc.)

    ../../modules/services/netbird.nix
  ];

  security.sudo.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.docker.daemon.settings = {
    data-root = "/SSD_SANDISK/docker";
  };

  # to help us export paperless in clean way.
  services.cron = {
    enable = true;
    systemCronJobs = [
      "0 3 * * 0 root cd /home/li0nr/dockers/paperless && /run/current-system/sw/bin/docker compose exec -T paperless document_exporter ../export --delete --compare-checksums --no-progress-bar >> /var/log/paperless-backup.log 2>&1"
    ];
  };


}
