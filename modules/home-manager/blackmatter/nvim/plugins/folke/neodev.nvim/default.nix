{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.folke."neodev.nvim";
in
{
  options.blackmatter.programs.nvim.plugins.folke."neodev.nvim".enable =
    mkEnableOption "folke/neodev.nvim";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/folke/start/neodev.nvim".source =
        builtins.fetchGit {
          url = "https://github.com/folke/neodev.nvim";
          ref = "main";
          rev = "50eaabc6645b43ded9126f97080bff767063b1c6";
        };
    })
  ];
}
