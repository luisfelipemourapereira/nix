{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      display.enable = mkEnableOption "display";
    };
  };

  config =
    mkMerge [
      (mkIf cfg.display.enable {
        # monitors
        # kanshi is like autorandr but for wayland
        # https://github.com/emersion/kanshi
        systemd.user.services.kanshi = {
          description = "Kanshi output autoconfig ";
          wantedBy = [ "graphical-session.target" ];
          partOf = [ "graphical-session.target" ];
          serviceConfig = {
            # kanshi doesn't have an option to specifiy config file yet, so it looks
            # at .config/kanshi/config
            ExecStart = ''
              ${pkgs.kanshi}/bin/kanshi
            '';
            RestartSec = 5;
            Restart = "always";
          };
        };
      })
    ];
}
