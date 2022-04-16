{ pkgs, lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig }: {
  programs.tmux.enable = true;
  programs.tmux.extraConfig = builtins.readFile ./tmux.conf;
}
