{ lib, config, ... }:
with lib;
let
  author = "phaazon";
  name = "hop.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "90db1b2c61b820e230599a04fedcd2679e64bd07";
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
