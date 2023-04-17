{ lib, config, ... }:
with lib;
let
  author = "pwntester";
  name = "octo.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "91a87271552828a499c2ddcc6a3e36f09f38c1d3";
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
