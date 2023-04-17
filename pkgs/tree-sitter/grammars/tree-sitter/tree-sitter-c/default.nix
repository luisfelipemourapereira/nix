args:
let
  pkgs = args.inputs.nixpkgs.legacyPackages.x86_64-linux;

  src = builtins.fetchGit {
    url = "https://github.com/tree-sitter/tree-sitter-c.git";
    ref = "master";
    rev = "f35789006ccbe5be8db21d1a2dd4cc0b5a1286f2";
  };

  pkg = pkgs.stdenv.mkDerivation {
    inherit src;
    name = "tree-sitter-c-grammar";
    buildInputs = [ pkgs.nodejs pkgs.python3 pkgs.tree-sitter ];
    installPhase = "install -Dm755 src/parser.so $out/parser.so";
    buildPhase = ''
      tree-sitter generate
      cd src
      gcc -c parser.c
      gcc -shared -o parser.so parser.o
      cd ..
    '';
  };
in
pkg
