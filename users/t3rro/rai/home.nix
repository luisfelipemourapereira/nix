{ outputs, ... }:
{
  imports = [
    ../../t3rro/common
    ../../common/rai
  ];
  blackmatter.programs.nvim.enable = true;
  blackmatter.shell.enable = true;
  blackmatter.desktop.enable = true;
}
