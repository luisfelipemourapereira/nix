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
    # ./aws.nix
    # NOTE TODO 
    # want to place this but cannot because gem wants 0600
    # and nix places into store with different permissions
    # not matter what it seems.
    # ./private_gem_credentials.nix
  ];
}

