{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugin.groups.treesitter;
in
{
  options.blackmatter.programs.nvim.plugin.groups.treesitter =
    {
      enable = mkEnableOption "treesitter";
    };

  imports = [
    ../nvim-treesitter/nvim-treesitter
    ../nvim-treesitter/nvim-treesitter-refactor
    ../nvim-treesitter/nvim-treesitter-textobjects
  ];

  config =
    mkMerge [
      (mkIf cfg.enable
        {
          blackmatter.programs.nvim.plugins =
            {
              nvim-treesitter.nvim-treesitter.enable = true;
              nvim-treesitter.nvim-treesitter-refactor.enable = true;
              nvim-treesitter.nvim-treesitter-textobjects.enable = true;
            };
        }
      )
    ];
}
