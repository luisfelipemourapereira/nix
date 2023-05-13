{ lib, config, ... }:
with lib;
let
  author = "nvim-neotest";
  name = "neotest-plenary";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "e0d9b1530307a03abcc52fc0ae28f054dea3f752";
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
