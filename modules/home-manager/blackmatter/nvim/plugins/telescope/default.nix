{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugin.groups.telescope;
in
{
  options.blackmatter.programs.nvim.plugin.groups.telescope =
    {
      enable = mkEnableOption "telescope";
    };

  imports = [
    ../nvim-telescope/telescope.nvim
    ../nvim-telescope/telescope-file-browser.nvim
    ../nvim-telescope/telescope-project.nvim
    ../nvim-telescope/telescope-dap.nvim
    ../nvim-telescope/telescope-z.nvim
    ../danielpieper/telescope-tmuxinator.nvim
  ];

  config =
    mkMerge [
      (mkIf cfg.enable
        {
          # TODO: needs a valid macos build
          # TODO: turning off until a valid build
          # TODO: is created for the rust dependency
          blackmatter.programs.nvim.plugins =
            {
              nvim-telescope."telescope.nvim".enable = true;
              nvim-telescope."telescope-file-browser.nvim".enable = true;
              nvim-telescope."telescope-project.nvim".enable = true;
              nvim-telescope."telescope-dap.nvim".enable = true;
              nvim-telescope."telescope-z.nvim".enable = true;
              danielpieper."telescope-tmuxinator.nvim".enable = true;
            };
        }
      )
    ];
}
