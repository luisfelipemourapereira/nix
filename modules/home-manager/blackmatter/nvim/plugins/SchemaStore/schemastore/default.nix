{ lib, config, ... }:
with lib;
let
  author = "SchemaStore";
  name = "schemastore";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "166136b96a14f103a948053903e9339e63ad9170";
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
