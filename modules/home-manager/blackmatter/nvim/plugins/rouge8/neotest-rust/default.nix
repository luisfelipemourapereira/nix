{ lib, config, ... }:
with lib;
let
  author = "rouge8";
  name = "neotest-rust";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "eaaf57c2124067167b6f7dcab6feedfcabd27fbb";
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
