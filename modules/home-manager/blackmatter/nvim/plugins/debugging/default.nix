{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugin.groups.debugging;
in
{
  options.blackmatter.programs.nvim.plugin.groups.debugging =
    {
      enable = mkEnableOption "debugging";
    };

  imports = [
    ../ravenxrz/DAPInstall.nvim
    ../yriveiro/dap-go.nvim
    ../nvim-telescope/telescope-dap.nvim
    ../Pocco81/dap-buddy.nvim
    ../mfussenegger/nvim-dap
    ../jbyuki/one-small-step-for-vimkind
    ../leoluz/nvim-dap-go
    ../mfussenegger/nvim-dap-python
    ../theHamsta/nvim-dap-virtual-text
    ../suketa/nvim-dap-ruby
    ../rcarriga/nvim-dap-ui
  ];

  config =
    mkMerge [
      (mkIf cfg.enable
        {
          blackmatter.programs.nvim.plugins =
            {
              ravenxrz."DAPInstall.nvim".enable = true;
              yriveiro."dap-go.nvim".enable = true;
              nvim-telescope."telescope-dap.nvim".enable = true;
              Pocco81."dap-buddy.nvim".enable = false;
              mfussenegger.nvim-dap.enable = true;
              jbyuki.one-small-step-for-vimkind.enable = true;
              leoluz.nvim-dap-go.enable = true;
              mfussenegger.nvim-dap-python.enable = true;
              theHamsta.nvim-dap-virtual-text.enable = true;
              suketa.nvim-dap-ruby.enable = true;
              rcarriga.nvim-dap-ui.enable = true;

            };
        }
      )
    ];
}
