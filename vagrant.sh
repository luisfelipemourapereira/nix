#!/usr/bin/env sh
# build it with nix
sudo cp custom-configuration.nix /etc/nixos/custom-configuration.nix
sudo nixos-rebuild switch
sudo /vagrant/scripts/enforce/vader.sh
