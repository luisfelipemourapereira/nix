{ lib, config, ... }:
with lib;
let
  nv = config.blackmatter.programs.nvim;
  cfg = nv.plugins.numToStr.Comment;
in
{
  options.blackmatter.programs.nvim.plugins.numToStr.Comment.enable = mkEnableOption "numToStr/Comment";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/numToStr/start/Comment.nvim".source =
        builtins.fetchGit {
          url = "https://github.com/numToStr/Comment.nvim";
          ref = "master";
          rev = "eab2c83a0207369900e92783f56990808082eac2";
        };
    })
  ];
}
