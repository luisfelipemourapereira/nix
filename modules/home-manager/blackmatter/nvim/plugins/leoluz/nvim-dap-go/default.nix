{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.leoluz.nvim-dap-go;
in
{
  options.blackmatter.programs.nvim.plugins.leoluz.nvim-dap-go.enable =
    mkEnableOption "leoluz/nvim-dap-go";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/leoluz/start/nvim-dap-go".source =
        builtins.fetchGit {
          url = "https://github.com/leoluz/nvim-dap-go";
          ref = "main";
          rev = "b4ded7de579b4e2a85c203388233b54bf1028816";
        };
    })
  ];
}
