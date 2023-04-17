{ lib, config, ... }:
with lib;
let
  author = "nvim-neorg";
  name = "neorg";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "532548b9f444bd1ae6f2efd3edd842282cc79659";
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
