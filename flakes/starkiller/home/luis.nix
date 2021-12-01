{ config, pkgs, ... }: rec { 
  programs.home-manager.enable = true;
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
