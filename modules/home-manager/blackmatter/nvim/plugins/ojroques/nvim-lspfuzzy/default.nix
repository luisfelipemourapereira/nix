{ lib, config, ... }:
with lib;
let
  author = "ojroques";
  name = "nvim-lspfuzzy";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "7c9f861fdf0adc4a4361355f892c4a3f7431bfa9";
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
