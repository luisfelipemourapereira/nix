{ lib, config, ... }:
with lib;
let
  author = "ldelossa";
  name = "litee.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "bf366a1414fd0f9401631ac8884f2f9fa4bf18d2";
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
