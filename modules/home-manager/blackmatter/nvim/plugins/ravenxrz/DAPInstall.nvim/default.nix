{ lib, config, ... }:
with lib;
let
  author = "ravenxrz";
  name = "DAPInstall.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "8798b4c36d33723e7bba6ed6e2c202f84bb300de";
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
