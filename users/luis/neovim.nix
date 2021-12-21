{ pkgs, lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig
}: {
  programs.neovim.enable = true;
  programs.neovim.viAlias = true;
  programs.neovim.vimAlias = true;
  programs.neovim.vimdiffAlias = true;
  # programs.neovim.withNodeJs = true;
  # programs.neovim.withRuby = true;
  # programs.neovim.withPython3 = true;
  # programs.neovim.extraPackages = [ pkgs.shfmt ];

  # programs.neovim.plugins = [
  # pkgs.vimPlugins.sensible
  # pkgs.vimPlugins.solarized
  # pkgs.vimPlugins.commentary
  # ];

  # programs.neovim.extraPackages = [
  # pkgs.tree-sitter
  # pkgs.rnix-lsp
  # pkgs.nodePackages.typescript
  # pkgs.nodePackages.typescript-language-server
  # ];
}
