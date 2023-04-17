{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.nvim-telescope."telescope-file-browser.nvim";
in
{
  options.blackmatter.programs.nvim.plugins.nvim-telescope."telescope-file-browser.nvim".enable =
    mkEnableOption "nvim-telescope/telescope-file-browser.nvim";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/nvim-telescope/start/telescope-file-browser.nvim".source =
        builtins.fetchGit {
          url = "https://github.com/nvim-telescope/telescope-file-browser.nvim";
          ref = "master";
          rev = "61b3769065131129716974f7fb63f82ee409bd80";
        };
    })
  ];
}
