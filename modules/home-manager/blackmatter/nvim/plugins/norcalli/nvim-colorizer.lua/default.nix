{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.norcalli."nvim-colorizer.lua";
in
{
  options.blackmatter.programs.nvim.plugins.norcalli."nvim-colorizer.lua".enable =
    mkEnableOption "norcalli/nvim-colorizer.lua";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/norcalli/start/nvim-colorizer.lua".source =
        builtins.fetchGit {
          url = "https://github.com/norcalli/nvim-colorizer.lua";
          ref = "master";
          rev = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6";
        };
    })
  ];
}
