{ config, pkgs, nixpkgs, lib, ... }: {
  home.packages = with pkgs; [ ripgrep ];
  # jq
  programs.jq.enable = true;
}
