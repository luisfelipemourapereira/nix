{ config, pkgs, nixpkgs, lib, specialArgs, options, modulesPath, nixosConfig }:
{
  # imports = [ ./packages.nix ./environment.nix ./zsh.nix ./starship.nix ];
  # imports = [ ./packages.nix ./environment.nix ./zsh.nix ];
  # imports = [ ./packages.nix ./environment.nix ./neovim.nix ];

  # home-manager manage itself
  # programs.home-manager.enable = true;

  # home configuration
  # home.username = "luis";
  # home.homeDirectory = "/home/luis";

  # home.stateVersion = "21.11";
}
