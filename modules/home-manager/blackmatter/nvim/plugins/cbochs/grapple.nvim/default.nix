{ lib, config, ... }:
with lib;
let
  author = "cbochs";
  name = "grapple.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "ab274a3bfb674442d57fca05df866b71895853bc";
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
