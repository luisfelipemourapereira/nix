{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.suketa.nvim-dap-ruby;
in
{
  options.blackmatter.programs.nvim.plugins.suketa.nvim-dap-ruby.enable =
    mkEnableOption "suketa/nvim-dap-ruby";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/suketa/start/nvim-dap-ruby".source =
        builtins.fetchGit {
          url = "https://github.com/suketa/nvim-dap-ruby";
          ref = "main";
          rev = "0a18182c6e5ee62b690b0c6ace155e4bbc4cd37f";
        };
    })
  ];
}
