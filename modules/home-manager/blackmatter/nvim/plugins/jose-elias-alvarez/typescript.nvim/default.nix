{ lib, config, ... }:
with lib;
let
  author = "jose-elias-alvarez";
  name = "typescript.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "f66d4472606cb24615dfb7dbc6557e779d177624";
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
