{ pkgs, lib, config, specialArgs, options }: {
  home.packages = with pkgs; [ ripgrep ];
  # jq
  programs.jq.enable = true;
}
