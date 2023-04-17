{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      desktop.alacritty.enable = mkEnableOption "desktop.alacritty";
    };
  };
  config = mkMerge [
    (mkIf cfg.desktop.alacritty.enable {
      programs.alacritty.enable = true;
      xdg.configFile."alacritty/alacritty.yml".source = ./alacritty.yml;
    })
  ];
}
