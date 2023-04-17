{ lib, config, ... }:
with lib;
let
  author = "ziontee113";
  name = "icon-picker.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "66d37ceae84099ca76235de44466829eb37118c2";
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
