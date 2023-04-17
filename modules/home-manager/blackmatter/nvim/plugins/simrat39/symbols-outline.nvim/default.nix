{ lib, config, ... }:
with lib;
let
  author = "simrat39";
  name = "symbols-outline.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "512791925d57a61c545bc303356e8a8f7869763c";
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
