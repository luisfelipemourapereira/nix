{ pkgs, lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig }: {
  home.packages = with pkgs; [ ripgrep ];
  # jq
  programs.jq.enable = true;
}
