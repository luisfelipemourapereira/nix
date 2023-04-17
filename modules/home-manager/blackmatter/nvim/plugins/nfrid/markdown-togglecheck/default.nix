{ lib, config, ... }:
with lib;
let
  author = "nfrid";
  name = "markdown-togglecheck";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "c0656836e2ef0b1c2ff6d8b68d3d11ac7973282e";
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
