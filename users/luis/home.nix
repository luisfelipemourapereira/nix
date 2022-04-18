{ config
, pkgs
, nixpkgs
, lib
, specialArgs
, options
, modulesPath
, nixosConfig
, osConfig
}: {
  imports = [
    ./home-manager.nix
    ./environment.nix
    ./packages.nix
    ./starship.nix
    ./neovim.nix
    ./tmux.nix
    ./files.nix
    ./shell.nix
    ./alacritty.nix
    ./terraform.nix
    ./direnv.nix
    ./aws.nix
    ./private_gem_credentials.nix
  ];
}

