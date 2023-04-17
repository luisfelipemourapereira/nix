{ lib, config, ... }:
with lib;
let
  author = "ggandor";
  name = "leap.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "f74473d23ebf60957e0db3ff8172349a82e5a442";
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
