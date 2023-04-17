{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      virtualization.enable = mkEnableOption "boot";
    };
  };

  config =
    mkMerge [
      (mkIf cfg.virtualization.enable {
        virtualisation.podman.enable = true;
        virtualisation.podman.dockerSocket.enable = true;
        virtualisation.podman.defaultNetwork.settings.dns_enabled = true;
        virtualisation.docker.enable = false;
        virtualisation.docker.rootless = {
          setSocketVariable = true;
          enable = true;
        };
        virtualisation.libvirtd.enable = true;
      })
    ];
}
