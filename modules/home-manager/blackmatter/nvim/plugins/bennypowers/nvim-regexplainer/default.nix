{ lib, config, ... }:
with lib;
let
  author = "bennypowers";
  name = "nvim-regexplainer";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "f7ceb71176a892e24349b6f9bc30b3088fde9ac6";
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
