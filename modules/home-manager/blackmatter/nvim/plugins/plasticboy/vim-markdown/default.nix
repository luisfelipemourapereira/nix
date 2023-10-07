{ lib, config, ... }:
with lib;
let
  author = "preservim";
  name = "vim-markdown";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "4e9b4deda11d05a157ab34e97f76089669b5b7af";
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
