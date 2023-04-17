args:
let
  pkgs = args.inputs.nixpkgs.legacyPackages.x86_64-linux;

  src = builtins.fetchGit {
    url = "https://github.com/tree-sitter/tree-sitter-ruby.git";
    ref = "master";
    rev = "206c7077164372c596ffa8eaadb9435c28941364";
  };

  pkg = pkgs.stdenv.mkDerivation {
    inherit src;
    name = "tree-sitter-ruby-grammar";
    nativeBuildInputs = [ pkgs.ruby_3_1 ];
    buildInputs = [ pkgs.nodejs pkgs.python3 pkgs.tree-sitter ];
    installPhase = ''
      install -Dm755 src/parser.so $out/parser.so
    '';
    buildPhase = ''
      tree-sitter generate
      cd src
      gcc -c parser.c
      gcc -shared -o parser.so -I${pkgs.ruby_3_1}/include/ruby-3.1.0/ruby.h -L${pkgs.ruby_3_1}/lib parser.o
      cd ..
    '';
  };
in
pkg
