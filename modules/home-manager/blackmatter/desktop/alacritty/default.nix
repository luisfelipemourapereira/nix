{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      desktop.alacritty.enable = mkEnableOption "desktop.alacritty";
      desktop.alacritty.config.enable = mkEnableOption "desktop.alacritty.config";
    };
  };
  config = mkMerge [
    (mkIf cfg.desktop.alacritty.enable {
      programs.alacritty.enable = true;
    })
    (mkIf cfg.desktop.alacritty.config.enable {
      xdg.configFile."alacritty/alacritty.yml".source = ./alacritty.yml;
    })
  ];
}
