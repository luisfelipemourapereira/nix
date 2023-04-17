{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.nvim-tree.nvim-web-devicons;
in
{
  options.blackmatter.programs.nvim.plugins.nvim-tree.nvim-web-devicons.enable = mkEnableOption "nvim-tree/nvim-web-devicons";

  config = mkMerge [
    (mkIf cfg.enable {
      # icons
      home.file.".local/share/nvim/site/pack/nvim-tree/start/nvim-web-devicons".source =
        builtins.fetchGit {
          url = "https://github.com/nvim-tree/nvim-web-devicons";
          ref = "master";
          rev = "6c38926351372ea87034dec26182b62c835ff3bc";
        };
    })
  ];
}
