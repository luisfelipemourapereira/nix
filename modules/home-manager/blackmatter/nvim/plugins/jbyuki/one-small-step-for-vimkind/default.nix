{ lib, config, ... }:
with lib;
let
  author = "jbyuki";
  name = "one-small-step-for-vimkind";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "aef1bdbb8347e6daaf33d5109002f3df243ebfe9";
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
