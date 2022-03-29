{ pkgs, lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig}: {
  programs.alacritty.enable = true;
  xdg.configFile."alacritty/alacritty.yml".source = ../../configurations/alacritty/alacritty.yml;
}
