{ outputs, ... }:
{
  imports = [
    outputs.homeManagerModules.blackmatter
    ../../luis/common
    ../../common/rai
  ];
  blackmatter.programs.nvim.enable = true;
  blackmatter.shell.enable = true;
  blackmatter.desktop.enable = true;
}
