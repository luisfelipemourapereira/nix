{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.maaslalani.nordbuddy;
in
{
  options.blackmatter.programs.nvim.plugins.maaslalani.nordbuddy.enable =
    mkEnableOption "maaslalani/nordbuddy";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/maaslalani/start/nordbuddy".source =
        builtins.fetchGit {
          url = "https://github.com/andersevenrud/nordic.nvim";
          ref = "main";
          rev = "cd552784eeeae61644fec60f6cc52c267dbddc73";
        };
    })
  ];
}
