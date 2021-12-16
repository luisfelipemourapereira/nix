{ lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig }: {
  programs.neovim.enable = true;
  programs.neovim.viAlias = true;
  programs.neovim.vimAlias = true;
  programs.neovim.vimdiffAlias = true;
  programs.neovim.withNodeJs = true;
  programs.neovim.withRuby = true;
  programs.neovim.withPython3 = true;
  programs.neovim.extraPackages = [
    unstable.tree-sitter
    pkgs.rnix-lsp
    unstable.nodePackages.typescript
    unstable.nodePackages.typescript-language-server
  ];
}
