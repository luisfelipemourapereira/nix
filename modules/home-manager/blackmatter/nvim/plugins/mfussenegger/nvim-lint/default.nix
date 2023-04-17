{ lib, config, ... }:
with lib;
let
  author = "mfussenegger";
  name = "nvim-lint";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "b16e6e424ddfb12d4b3a699c1dc41ba0f3b503da";
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
