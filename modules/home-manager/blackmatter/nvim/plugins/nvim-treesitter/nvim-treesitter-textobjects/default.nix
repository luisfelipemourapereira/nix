{ lib, config, ... }:
with lib;
let
  author = "nvim-treesitter";
  name = "nvim-treesitter-textobjects";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "35a60f093fa15a303874975f963428a5cd24e4a0";
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
