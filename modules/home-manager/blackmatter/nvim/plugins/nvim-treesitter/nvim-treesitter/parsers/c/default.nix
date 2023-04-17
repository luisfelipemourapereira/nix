{ ... }:
let
in
{
  options = { };
  config = {
    # home.file.".local/share/nvim/site/srcs/tree-sitter/tree-sitter-c".source =
    #   builtins.fetchGit {
    #     url = "https://github.com/tree-sitter/tree-sitter-c";
    #     ref = "master";
    #     rev = "f35789006ccbe5be8db21d1a2dd4cc0b5a1286f2";
    #   };
  };
}
