{ lib, config, ... }:
with lib;
let
  author = "iamcco";
  name = "markdown-preview.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "02cc3874738bc0f86e4b91f09b8a0ac88aef8e96";
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

      home.activation.${name} = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        cd ${config.home.homeDirectory}/${plugPath}/app
        npm install
      '';
    })
  ];
}
