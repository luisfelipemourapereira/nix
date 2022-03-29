{ pkgs, lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig
}: {
  home.packages = with pkgs; [ ripgrep xsel ];
  # jq
  programs.jq.enable = true;
  # neovim
  programs.neovim.enable = true;
}
