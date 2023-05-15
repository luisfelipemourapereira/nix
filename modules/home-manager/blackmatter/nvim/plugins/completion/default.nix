{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugin.groups.completion;
in
{
  options.blackmatter.programs.nvim.plugin.groups.completion =
    {
      enable = mkEnableOption "completion";
    };

  imports = [
    ../hrsh7th/nvim-cmp
  ];

  config =
    mkMerge [
      (mkIf cfg.enable
        {
          blackmatter.programs.nvim.plugins =
            {
              hrsh7th.nvim-cmp.enable = true;
            };
        }
      )
    ];
}
