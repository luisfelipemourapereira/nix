{ lib, config, ... }:
with lib;
let
  author = "RishabhRD";
  name = "nvim-lsputils";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "ae1a4a62449863ad82c70713d5b6108f3a07917c";
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
