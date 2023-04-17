{ lib, config, pkgs, inputs, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  imports = [
    inputs.nix-pub.nixosModules.consul
    inputs.home-manager.nixosModules.home-manager
  ];

  options = {
    blackmatter = {

      global.enable = mkEnableOption "blackmatter";

      system.version = mkOption {
        type = types.str;
        default = "22.05";
        description = lib.mkDoc "nixos version";
      };

      host = mkOption {
        type = types.str;
        default = "bm";
        description = lib.mkDoc "hostname for the node";
      };

    };
  };

  config =
    mkMerge [
      (mkIf cfg.global.enable {
        system.stateVersion = cfg.system.version;
        services.hardware.bolt.enable = false;
        networking.hostName = cfg.host;
        i18n.defaultLocale = "en_US.UTF-8";
        console = { font = "Lat2-Terminus16"; keyMap = "us"; };
        time.timeZone = "US/Pacific";
        nixpkgs.config.permittedInsecurePackages = [
          "python2.7-pyjwt-1.7.1"
          "python-2.7.18.6"
          "python2.7-certifi-2021.10.8"
        ];
        # should stop random suspensions
        # https://github.com/NixOS/nixpkgs/issues/130947
        services.logind.lidSwitch = "ignore";

        # unlock the cpu gov to full powa!!!!
        powerManagement.cpuFreqGovernor = "performance";
        nix = {
          package = pkgs.nixFlakes;
          extraOptions = ''
            experimental-features = nix-command flakes
          '';
        };
      })
    ];
}
