{ lib, config, ... }:
with lib;
let
  author = "michaelb";
  name = "sniprun";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "562ccadf7ed93d6223564714cb2b57f1805f3e06";
  plugPath = ".local/share/nvim/site/pack/${author}/start/${name}";
  cfg = config.blackmatter.programs.nvim.plugins.${author}.${name};
in
{
  options.blackmatter.programs.nvim.plugins.${author}.${name}.enable =
    mkEnableOption "${author}/${name}";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file."${plugPath}".source =
        builtins.fetchGit { inherit ref rev url; };
    })
  ];
}
