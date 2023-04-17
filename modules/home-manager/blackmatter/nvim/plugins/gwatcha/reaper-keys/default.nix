{ lib, config, ... }:
with lib;
let
  author = "gwatcha";
  name = "reaper-keys";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "8435f68d16d75bf1358128f5cab62318c3c79b6f";
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
