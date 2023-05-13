{ lib, config, ... }:
with lib;
let
  author = "tpope";
  name = "vim-repeat";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "24afe922e6a05891756ecf331f39a1f6743d3d5a";
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
