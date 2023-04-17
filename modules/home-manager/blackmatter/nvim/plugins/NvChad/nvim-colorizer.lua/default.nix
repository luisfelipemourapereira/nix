{ lib, config, ... }:
with lib;
let
  author = "NvChad";
  name = "nvim-colorizer.lua";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "dde3084106a70b9a79d48f426f6d6fec6fd203f7";
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
