{ lib, config, ... }:
with lib;
let
  author = "RRethy";
  name = "vim-illuminate";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "a2907275a6899c570d16e95b9db5fd921c167502";
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
