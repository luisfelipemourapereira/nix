{ lib, config, ... }:
with lib;
let
  author = "rafcamlet";
  name = "nvim-luapad";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "a5b3d6aa1fe5fe75e6124927392a9d3a60a0ecce";
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
