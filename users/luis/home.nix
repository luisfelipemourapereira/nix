{ config, pkgs, nixpkgs, lib, specialArgs, options, modulesPath, nixosConfig
, osConfig }: {
  programs.home-manager.enable = true;
  # imports = [ ./packages.nix ./environment.nix ./zsh.nix ./starship.nix ];
  # imports = [ ./packages.nix ./environment.nix ./zsh.nix ];
  # imports = [ ./packages.nix ./environment.nix ./neovim.nix ];
  imports = [ ./packages.nix ];

  home.username = "luis";
  home.homeDirectory = "/home/luis";

  home.stateVersion = "21.11";
}
