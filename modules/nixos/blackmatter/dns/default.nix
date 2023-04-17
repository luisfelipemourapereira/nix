{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      dns.enable = mkEnableOption "dns";
    };
  };

  config =
    mkMerge [
      (mkIf cfg.dns.enable {
        services.dnsmasq.enable = true;
        services.dnsmasq.settings.server = [
          "/vpn.tapresearch.io/8.8.8.8"
          "/tapresearch.io/10.0.0.2"
          "1.1.1.1"
          "1.0.0.1"
          "8.8.8.8"
          "8.8.4.4"
        ];
      })
    ];
}
