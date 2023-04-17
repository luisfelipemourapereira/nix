{ lib, config, ... }:
with lib;
let
  author = "mrjones2014";
  name = "legendary.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "1a2022a818388d691b1de3187c241e67c2ce0792";
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
