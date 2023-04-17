{ lib, config, ... }:
with lib;
let
  author = "gnikdroy";
  name = "projections.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "008de87749e6baa402a2ce2f3ebc75e724b95da1";
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
