{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.antimatter.services.consul;
  data = config.antimatter.data.consul;

  module_enabled = {
    systemd.services = {
      consul = {
        after = ["network-online.target"];
        wantedBy = ["multi-user.target"];
        description = "consul service";
        serviceConfig = {
          Type = "simple";
          ExecStart = data.devCmd;
          Restart = "always";
          RestartSec = 10;
        };
      };
    };
  };
in
{
  imports = [ ../../data/consul ];

  options.antimatter.services.consul =
    { enable = mkEnableOption "antimatter.services.consul"; };

  config = mkMerge [ (mkIf cfg.enable module_enabled) ];
}

