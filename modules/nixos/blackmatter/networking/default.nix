{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      networking.enable = mkEnableOption "networking";
    };
  };

  config =
    mkMerge [
      (mkIf cfg.networking.enable {
        networking.firewall.enable = false;
        networking.firewall.extraCommands = ''
          ip46tables -I INPUT 1 -i vboxnet+ -p tcp -m tcp --dport 2049 -j ACCEPT
        '';
        networking.wireless.enable = false;
        networking.wireless.interfaces = [ "wlp0s20f3" ];
      })
    ];
}
