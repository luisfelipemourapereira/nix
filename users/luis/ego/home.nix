{ outputs, ... }:
{
  imports = [
    outputs.homeManagerModules.blackmatter
    ../../luis/common
    ../common
  ];
  blackmatter.programs.nvim.enable = true;
  blackmatter.shell.enable = true;
  blackmatter.desktop.enable = true;
  blackmatter.desktop.alacritty.config.enable = true;
  # blackmatter.desktop.monitors = {
  #   main = {
  #     name = "DP-2";
  #     mode = "1920x1080";
  #     rate = "360";
  #   };
  # };
}
