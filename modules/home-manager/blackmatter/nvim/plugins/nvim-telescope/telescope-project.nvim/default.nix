{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.nvim-telescope."telescope-project.nvim";
in
{
  options.blackmatter.programs.nvim.plugins.nvim-telescope."telescope-project.nvim".enable =
    mkEnableOption "nvim-telescope/telescope-project.nvim";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/nvim-telescope/start/telescope-project.nvim".source =
        builtins.fetchGit {
          url = "https://github.com/nvim-telescope/telescope-project.nvim";
          ref = "master";
          rev = "8e8ee37b7210761502cdf2c3a82b5ba8fb5b2972";
        };
    })
  ];
}
