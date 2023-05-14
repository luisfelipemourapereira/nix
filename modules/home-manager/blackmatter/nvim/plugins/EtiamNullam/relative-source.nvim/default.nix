{ lib, config, ... }:
with lib;
let
  author = "EtiamNullam";
  name = "relative-source.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "921924968fbd9c08f577ebf48cf0abbe30b07350";
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

