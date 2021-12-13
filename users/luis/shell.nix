{ config, pkgs, nixpkgs, lib, specialArgs, options, modulesPath, nixosConfig
, osConfig }: {
  # zsh shell
  programs.zsh.enable = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableSyntaxHighlighting = true;
  programs.zsh.defaultKeymap = "viins";
  programs.zsh.autocd = false;
  programs.zsh.dotDir = ".config/zsh";
  programs.zsh.prezto.enable = true;
  programs.zsh.history.size = 1000000;
  programs.zsh.history.save = 1000000;
}
