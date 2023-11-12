{ outputs, ... }:
{
  imports = [
    outputs.homeManagerModules.blackmatter
    ../../ldesiqueira/common
    ../../common/rai
  ];
  blackmatter.programs.nvim.enable = true;
  blackmatter.shell.enable = true;
  blackmatter.desktop.enable = false;
}
