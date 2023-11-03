{ outputs, ... }:
{
  imports = [
    outputs.homeManagerModules.blackmatter
    ../../lucas/common
    ../common
  ];
  blackmatter.programs.nvim.enable = true;
  blackmatter.shell.enable = true;
  blackmatter.desktop.enable = false;
  # blackmatter.desktop.alacritty.enable = false;
  blackmatter.desktop.alacritty.config.enable = true;
}
