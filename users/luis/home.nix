{ config, pkgs, nixpkgs, lib, specialArgs, options, modulesPath, nixosConfig
, osConfig }: {
  programs.home-manager.enable = true;
  imports = [ ./packages.nix ./environment.nix ./starship.nix ./files.nix ];
  # ./neovim.nix
  # ./shell.nix
  home.username = "luis";
  home.homeDirectory = "/home/luis";
  home.stateVersion = "21.11";
}
