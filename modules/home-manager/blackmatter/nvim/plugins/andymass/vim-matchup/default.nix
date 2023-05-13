{ lib, config, ... }:
with lib;
let
  author = "andymass";
  name = "vim-matchup";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "6c8909b682803d8c3a054259079f158a73a0e30f";
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
