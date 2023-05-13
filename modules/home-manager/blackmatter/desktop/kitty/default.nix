{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      desktop.kitty.enable = mkEnableOption "desktop.kitty";
    };
  };
  config = mkMerge [
    (mkIf cfg.desktop.kitty.enable {
      programs.kitty.enable = true;
      xdg.configFile."kitty/kitty.conf".source = ./kitty.conf;
    })
  ];
}
