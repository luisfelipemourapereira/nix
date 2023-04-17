{ outputs, ... }:
{
  imports = [
    ../../t3rro/common
    ../../common/plo
    outputs.homeManagerModules.blackmatter
  ];
  blackmatter.programs.nvim.enable = true;
  blackmatter.shell.enable = true;
  blackmatter.desktop.enable = true;
}
