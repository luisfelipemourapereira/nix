{ lib, config, ... }:
with lib;
let
  author = "wellle";
  name = "targets.vim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "642d3a4ce306264b05ea3219920b13ea80931767";
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
