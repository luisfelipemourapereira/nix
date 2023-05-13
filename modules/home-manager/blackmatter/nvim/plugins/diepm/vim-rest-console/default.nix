{ lib, config, ... }:
with lib;
let
  author = "diepm";
  name = "vim-rest-console";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "7b407f47185468d1b57a8bd71cdd66c9a99359b2";
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
