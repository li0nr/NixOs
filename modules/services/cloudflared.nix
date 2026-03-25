{ config, pkgs, ... }:
{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "e798343c-461e-40fb-97d7-65b16d5f4c06" = {
          credentialsFile = "/etc/cloudflared/e798343c-461e-40fb-97d7-65b16d5f4c06.json";
          default = "http_status:404";
          ingress = {
            "ssh.li0nr.uk" = "ssh://localhost:22";
            };
        };
    };
  };
}
