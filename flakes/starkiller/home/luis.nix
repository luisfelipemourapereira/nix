{ config, pkgs, ... }: { 
  programs.home-manager.enable = true;
  
  # alacritty
  programs.alacritty.enable = true;

  # zsh
  programs.zsh.enable = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.prezto.enable = true;

  home.username = "luis"; 
  home.homeDirectory = "/home/luis"; 
  home.packages = with pkgs; [
    jq
    neovim
    ripgrep
  ];
  home.sessionVariables = {
    EDITOR = "neovim";
  };
  home.stateVersion = "21.11";
}
