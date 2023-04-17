{ lib, config, ... }:
with lib;
let
  author = "glepnir";
  name = "lspsaga.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "04617d1f5b1cfbdd2a99d9765ef04fc6ae415622";
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
