{ lib, config, ... }:
with lib;
let
  author = "ggandor";
  name = "leap.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "6f2912755c9c4ae790abd829f0cf1b07c037b2a4";
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
