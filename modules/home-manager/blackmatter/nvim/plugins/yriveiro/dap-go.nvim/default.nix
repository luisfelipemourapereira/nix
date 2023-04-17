{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.yriveiro."dap-go.nvim";
in
{
  options.blackmatter.programs.nvim.plugins.yriveiro."dap-go.nvim".enable =
    mkEnableOption "yriveiro/dap-go.nvim";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/yriveiro/start/dap-go.nvim".source =
        builtins.fetchGit {
          url = "https://github.com/yriveiro/dap-go.nvim";
          ref = "main";
          rev = "4451cbf39590fcf1b9a8281e0d320a2403ab56d9";
        };
    })
  ];
}
