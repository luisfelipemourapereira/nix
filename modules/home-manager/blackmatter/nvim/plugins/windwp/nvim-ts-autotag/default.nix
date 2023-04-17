{ lib, config, ... }:
with lib;
let
  author = "windwp";
  name = "nvim-ts-autotag";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "25698e4033cd6cd3745454bfc837dd670eba0480";
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
