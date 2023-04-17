{ lib, config, ... }:
with lib;
let
  author = "f-person";
  name = "git-blame.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "1ad47c6454a5a53d3f4ffdd4022e84f4a6e376cb";
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
