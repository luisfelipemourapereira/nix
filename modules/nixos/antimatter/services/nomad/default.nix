{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.antimatter.services.nomad;
  data = config.antimatter.data.nomad;
  module_enabled = {
    systemd.services = {
      nomad = {
        after = ["network-online.target"];
        wantedBy = ["multi-user.target"];
        description = "nomad service";
        serviceConfig = {
          Type = "simple";
          ExecStart = data.devCmd;
          RestartSec = 10;
          Restart = "always";
          User = data.user;
          Group = "root";
          # Environment = "PATH=/run/current-system/sw/bin:$PATH";
          # PrivateTmp = "no";
          # ProtectSystem = "no";
          # WorkingDirectory = "/tmp";
          # StandardOutput = "journal";
          # StandardError = "journal";
        };
      };
    };
  };
in
{
  imports = [ ../../data/nomad ];

  options.antimatter.services.nomad =
    { enable = mkEnableOption "antimatter.services.nomad"; };

  config = mkMerge [ (mkIf cfg.enable module_enabled) ];
}
