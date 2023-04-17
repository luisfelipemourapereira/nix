{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.lewis6991.impatient;
in
{
  options.blackmatter.programs.nvim.plugins.lewis6991.impatient.enable = mkEnableOption "lewis6991/impatient";

  config = mkMerge [
    (mkIf cfg.enable {
      # speed up loading times
      home.file.".local/share/nvim/site/pack/lewis6991/start/impatient.nvim".source =
        builtins.fetchGit {
          url = "https://github.com/lewis6991/impatient.nvim";
          ref = "main";
          rev = "c90e273f7b8c50a02f956c24ce4804a47f18162e";
        };
    })
  ];
}
