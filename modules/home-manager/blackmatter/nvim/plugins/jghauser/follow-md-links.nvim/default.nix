{ lib, config, ... }:
with lib;
let
  author = "jghauser";
  name = "follow-md-links.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "ccc50e7ba191e62b4243ddd3db9b7dbddf2ee179";
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
