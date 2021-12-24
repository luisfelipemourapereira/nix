{ config, pkgs, nixpkgs, lib, specialArgs, options, modulesPath, nixosConfig
, osConfig }: {
  imports = [
    ./packages.nix
    ./environment.nix
    ./starship.nix
    ./files.nix
    ./shell.nix
    ./neovim.nix
  ];
  programs.home-manager.enable = true;
  home.username = "luis";
  home.homeDirectory = "/home/luis";
  home.stateVersion = "21.11";
}
