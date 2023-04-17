{ lib, config, ... }:
with lib;
let
  author = "kkharji";
  name = "sqlite.lua";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "376e4735c48e07dade3e6ff5f09a654a04f5d4ba";
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
