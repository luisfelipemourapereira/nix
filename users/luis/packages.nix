{ pkgs, lib, config, specialArgs }: {
  home.packages = with pkgs; [ ripgrep ];
  # jq
  programs.jq.enable = true;
}
