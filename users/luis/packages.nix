{ pkgs, lib, config, specialArgs, options, modulesPath, nixosConfig }: {
  home.packages = with pkgs; [ ripgrep ];
  # jq
  programs.jq.enable = true;
}
