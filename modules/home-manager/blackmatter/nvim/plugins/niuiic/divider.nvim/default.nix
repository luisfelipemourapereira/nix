{ lib, config, ... }:
with lib;
let
  author = "niuiic";
  name = "divider.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "41eee9f44cc591529f7f5a54b725b30f47319bce";
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
