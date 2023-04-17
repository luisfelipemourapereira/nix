{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.nvim-telescope."telescope.nvim";
in
{
  options.blackmatter.programs.nvim.plugins.nvim-telescope."telescope.nvim".enable =
    mkEnableOption "nvim-telescope/telescope.nvim";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/nvim-telescope/start/telescope.nvim".source =
        builtins.fetchGit {
          url = "https://github.com/nvim-telescope/telescope.nvim";
          ref = "master";
          rev = "a3f17d3baf70df58b9d3544ea30abe52a7a832c2";
        };
    })
  ];
}
