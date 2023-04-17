{ lib, config, ... }:
with lib;
let
  author = "yamatsum";
  name = "nvim-nonicons";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "ceda07dc7339f35444b5f4c4016f76a9eb42ac16";
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
