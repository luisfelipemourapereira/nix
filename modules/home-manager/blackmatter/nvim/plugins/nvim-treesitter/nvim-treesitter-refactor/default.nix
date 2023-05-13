{ lib, config, ... }:
with lib;
let
  author = "nvim-treesitter";
  name = "nvim-treesitter-refactor";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "65ad2eca822dfaec2a3603119ec3cc8826a7859e";
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
