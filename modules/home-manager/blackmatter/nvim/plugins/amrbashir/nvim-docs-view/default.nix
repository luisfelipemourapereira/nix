{ lib, config, ... }:
with lib;
let
  author = "amrbashir";
  name = "nvim-docs-view";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "a7ba30f8d545ab0fd181e0f4fb84544ef9f236ac";
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
