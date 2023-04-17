# EXAMPLE: a great example of building a rust plugin dependency
{ lib, config, pkgs, inputs, ... }:
with lib;
let
  author = "jcdickinson";
  name = "http.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "a2b51f2f8345279f3bf017974a56fa494c560745";
  plugPath = ".local/share/nvim/site/pack/${author}/start/${name}";
  cfg = config.blackmatter.programs.nvim.plugins.${author}.${name};
  src = builtins.fetchGit { inherit ref rev url; };
  pkg = pkgs.rustPlatform.buildRustPackage rec {
    pname = name;
    inherit src;
    nativeBuildInputs = [
      pkgs.pkg-config
      pkgs.openssl.dev
    ];
    buildInputs = [ pkgs.openssl ];
    version = "unstable";
    cargoBuildFlags = [ "--workspace" ];
    postInstall = ''
      # Remove unnecessary files
      rm -rf $out/.cargo $out/.rustup
    '';
    cargoSha256 = "sha256-nvOjnjuwm2x487JAaQlngooQUquue4bKr8hnHEeD3Js=";

  };

in
{
  options.blackmatter.programs.nvim.plugins.${author}.${name}.enable =
    mkEnableOption "${author}/${name}";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file."${plugPath}".source = pkg;
    })
  ];
}
