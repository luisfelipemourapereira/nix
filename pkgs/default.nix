args: {
  tree-sitter-c-grammar =
    import ./tree-sitter/grammars/tree-sitter/tree-sitter-c/default.nix args;
  tree-sitter-ruby-grammar =
    import ./tree-sitter/grammars/tree-sitter/tree-sitter-ruby/default.nix args;
  tailwind-intellisense =
    import ./language-servers/css/tailwindlabs/tailwindcss-intellisense/default.nix args;
  drzln-neovim =
    import ./editors/nvim/default.nix args;
  ollama =
    import ./ai/ollama/default.nix args;
}
