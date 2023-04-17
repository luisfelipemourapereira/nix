{ lib, config, ... }:
with lib;
let
  author = "jcdickinson";
  name = "codeium.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "38a889a6b8e1612c9adbe97399012c638b210e65";
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
