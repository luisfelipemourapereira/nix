{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.ray-x.cmp-treesitter;
in
{
  options.blackmatter.programs.nvim.plugins.ray-x.cmp-treesitter.enable =
    mkEnableOption "ray-x/cmp-treesitter";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/ray-x/start/cmp-treesitter".source =
        builtins.fetchGit {
          url = "https://github.com/ray-x/cmp-treesitter";
          ref = "master";
          rev = "b40178b780d547bcf131c684bc5fd41af17d05f2";
        };
    })
  ];
}
