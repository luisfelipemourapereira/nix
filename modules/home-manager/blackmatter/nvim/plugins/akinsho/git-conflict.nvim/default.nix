{ lib, config, ... }:
with lib;
let
  author = "akinsho";
  name = "git-conflict.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "2957f747e1a34f1854e4e0efbfbfa59a1db04af5";
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
