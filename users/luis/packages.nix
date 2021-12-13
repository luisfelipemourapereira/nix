{ pkgs, lib, config, specialArgs, options, modulesPath }: {
  home.packages = with pkgs; [ ripgrep ];
  # jq
  programs.jq.enable = true;
}
