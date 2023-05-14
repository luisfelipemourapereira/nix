{ lib, config, ... }:
with lib;
let
  author = "kkoomen";
  name = "vim-doge";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "6d4c6601b6d37d893880deac7c402f70bc375d5f";
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
