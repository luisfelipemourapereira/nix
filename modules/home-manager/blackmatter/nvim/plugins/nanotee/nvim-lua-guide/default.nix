{ lib, config, ... }:
with lib;
let
  author = "nanotee";
  name = "nvim-lua-guide";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "393ea845b88661a8f54ec251ecca0b06a3c7fc49";
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
