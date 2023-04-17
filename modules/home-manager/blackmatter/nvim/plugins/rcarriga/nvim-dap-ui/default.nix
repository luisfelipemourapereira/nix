{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.rcarriga.nvim-dap-ui;
in
{
  options.blackmatter.programs.nvim.plugins.rcarriga.nvim-dap-ui.enable =
    mkEnableOption "rcarriga/nvim-dap-ui";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/rcarriga/start/nvim-dap-ui".source =
        builtins.fetchGit {
          url = "https://github.com/rcarriga/nvim-dap-ui";
          ref = "master";
          rev = "bdb94e3853d11b5ce98ec182e5a3719d5c0ef6fd";
        };
    })
  ];
}
