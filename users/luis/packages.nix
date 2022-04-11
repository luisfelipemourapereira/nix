{ pkgs, lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig
}: {
  home.packages = with pkgs; [ ripgrep xsel fzf ];
  # jq
  programs.jq.enable = true;
}
