{ lib, config, ... }:
with lib;
let
  author = "ellisonleao";
  name = "glow.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "a3f24fdaa71d2c25a2b88026032b34f5b6a6e215";
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
