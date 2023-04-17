{ pkgs, config, lib, ... }:
with lib;
let
  cfg = config.antimatter.data.consul;
in
{
  options.antimatter.data.consul = {
    bin = mkOption {
      type = types.str;
      default = "${cfg.package}/bin/consul";
      description = lib.mkDoc ''
        bin string
      '';
    };

    package = mkOption {
      type = types.package;
      default = pkgs.consul;
      description = lib.mkDoc ''
        the consul derivation
      '';
    };

    agent = mkOption {
      type = types.str;
      default = concatStringsSep " " [ cfg.bin "agent" ];
      description = lib.mkDoc ''
        bin string for consul agent
      '';
    };

    devCmd = mkOption {
      type = types.str;
      default = concatStringsSep " " [ cfg.agent "-dev" ];
      description = lib.mkDoc ''
        bring up consul server as development server
      '';
    };

    user = mkOption {
      type = types.str;
      default = "consul";
      description = lib.mkDoc ''
        the consul user
      '';
    };

    group = mkOption {
      type = types.str;
      default = "consul";
      description = lib.mkDoc ''
        the consul group
      '';
    };
  };
}
