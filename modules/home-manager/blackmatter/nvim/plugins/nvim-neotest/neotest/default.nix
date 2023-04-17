{ lib, config, ... }:
with lib;
let
  author = "nvim-neotest";
  name = "neotest";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "bbbfa55d850f1aaa6707ea85fb5230ac866459c6";
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
