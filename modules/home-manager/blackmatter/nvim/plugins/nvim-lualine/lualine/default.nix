{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.nvim-lualine.lualine;
in
{
  options.blackmatter.programs.nvim.plugins.nvim-lualine.lualine.enable = mkEnableOption "nvim-lualine/lualine";

  config = mkMerge [
    (mkIf cfg.enable {
      # control neovim status bar at bottom
      home.file.".local/share/nvim/site/pack/nvim-lualine/start/lualine.nvim".source =
        builtins.fetchGit {
          url = "https://github.com/nvim-lualine/lualine.nvim";
          ref = "master";
          rev = "0050b308552e45f7128f399886c86afefc3eb988";
        };
    })
  ];
}
