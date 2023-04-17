{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.shaunsingh.nord;
in
{
  options.blackmatter.programs.nvim.plugins.shaunsingh."nord".enable = mkEnableOption "shaunsingh/nord";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/shaunsingh/start/nord.nvim".source =
        builtins.fetchGit {
          url = "https://github.com/shaunsingh/nord.nvim";
          ref = "master";
          rev = "9824b8511dcb7d89de628d7e9bab5fa65c9d59d1";
        };
    })
  ];
}
