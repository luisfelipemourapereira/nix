{ lib, config, ... }:
with lib;
let
  author = "nvim-neorocks";
  name = "luarocks-tag-release";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "edaa93d52e6440ceab66030fff9096a91f755b15";
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
