# TODO: you are using mason now for this, finish nix based builds
args:
let
  pkgs = args.inputs.nixpkgs.legacyPackages.x86_64-linux;
  nodejs = pkgs.nodejs-16_x;

  sha256 = "sha256-DomY/lzsy4IahhsPMpGwt0D2ua+K3S7KKwZUGiJxnmg";
  owner = "tailwindlabs";
  repo = "tailwindcss-intellisense";
  rev = "v0.8.3";

  src = pkgs.fetchFromGitHub {
    inherit owner repo rev sha256;
  };

  # nodePackages = pkgs.stdenv.mkDerivation {
  #   inherit src;
  #   name = "node-packages";
  #   systemNodejs = true;
  #   buildInputs = [ nodejs ];
  # };

  # nodeDeps = nodePackages {
  #   inherit nodeEnv src;
  #   nodejsVersion = "16.x";
  # };


  pkg = pkgs.stdenv.mkDerivation {
    inherit src;
    name = "tailwindcss-intellisense";
    meta = with pkgs.meta; {
      description = "Intellisense for Tailwind CSS in Visual Studio Code";
      homepage = https://github.com/tailwindlabs/tailwindcss-intellisense;
      license = "MIT";
    };
    installPhase = ''
    cp -r $src $out
    '';
    # buildInputs = [ nodeDeps ];
    # installPhase = ''
    #   install -Dm755 ${nodeDeps}/bin/* $out/bin
    # '';
  };
in
pkg
