{ pkgs, config, lib, ... }:
with lib;
let
  cfg = config.antimatter.data.nomad;
in
{
  options.antimatter.data.nomad = rec {
    bin = mkOption {
      type = types.str;
      default = "${cfg.package}/bin/nomad";
      description = lib.mdDoc ''
        bin string
      '';
    };

    package = mkOption {
      type = types.package;
      default = pkgs.nomad;
      description = lib.mdDoc ''
        the nomad derivation
      '';
    };

    agent = mkOption {
      type = types.str;
      default = concatStringsSep " " [ cfg.bin "agent" ];
      description = lib.mdDoc ''
        bin string for nomad agent
      '';
    };

    driver = mkOption {
      type = types.enum [ "podman" "docker" ];
      default = "podman";
      description = mdDoc ''
        indicate a prebuilt configuration for a nomad driver
      '';
    };

    devConfigPath = mkOption {
      type = types.path;
      default = ./dev.hcl;
    };

    dataDir = mkOption {
      type = types.path;
      default = "/home/${cfg.user}/.cache/nomad/data";
    };

    devDataDir = mkOption {
      type = types.path;
      default = "${cfg.dataDir}/dev";
    };

    devPluginDir = mkOption {
      type = types.path;
      default = "${cfg.devDataDir}/plugins";
    };

    devPreloadScript = mkOption {
      type = types.package;
      default = pkgs.writeScript
        "devPreload.sh"
        ''
          ! [ -d ${cfg.devDataDir} ] && mkdir -p ${cfg.devDataDir}
          ! [ -d ${cfg.devPluginDir} ] && mkdir -p ${cfg.devPluginDir}
        '';
    };


    hclDevConfig = mkOption {
      type = types.package;
      default = pkgs.writeText
        "dev.hcl"
        ''
          datacenter = "dev.dc1"
          region = "localdev"
          data_dir = "${cfg.devDataDir}"

          bind_addr = "0.0.0.0"


          server {
          	enabled = true
          	bootstrap_expect = 1
          }

          client {
            enabled = true
            servers = ["localhost"]
            # options {
            #   "docker.privileged.enabled" = "true"
            #   "docker.privileged.seccomp_profile" = "unconfined"
            # }
          }

          plugin "nomad-driver-podman" {
            config {
              volumes {
                enabled = true
                selinuxlabel = "z"
              }
            }
          }
        '';
    };

    devScript = mkOption {
      type = types.package;
      default = pkgs.writeShellScript
        "devScript.sh"
        ''
          ${pkgs.coreutils}/bin/rm -rf /sbin
          ! [ -d /sbin ] && ${pkgs.coreutils}/bin/mkdir -p /sbin
          ! [ -L /sbin/ip ] && ${pkgs.coreutils}/bin/ln -s ${pkgs.iproute2}/bin/ip /sbin/ip
          ${cfg.devPreloadScript}
          ${cfg.agent} -config=${cfg.hclDevConfig}
        '';
    };

    devCmd = mkOption {
      type = types.str;
      default = "${cfg.devScript}";
      description = lib.mdDoc ''
        bring up nomad server as development server
      '';
    };

    user = mkOption {
      type = types.str;
      default = "root";
      description = lib.mdDoc ''
        the nomad user
      '';
    };

    group = mkOption {
      type = types.str;
      default = "nomad";
      description = lib.mdDoc ''
        the nomad group
      '';
    };
  };
}
