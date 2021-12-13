{ pkgs }: {
  home.packages = with pkgs; [ ripgrep ];
  # jq
  programs.jq.enable = true;
}
