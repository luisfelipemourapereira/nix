{ lib, config, ... }:
with lib;
let
  author = "rest-nvim";
  name = "rest.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "0fdb69f328529b34a2279c14be63b3325dc52740";
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
