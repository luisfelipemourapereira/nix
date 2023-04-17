{ lib, config, ... }:
with lib;
let
  author = "onsails";
  name = "lspkind.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "c68b3a003483cf382428a43035079f78474cd11e";
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
