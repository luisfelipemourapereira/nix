{ outputs, ... }:
let
  home = "/root";
  user = "root";
in
{
  imports = [
    outputs.homeManagerModules.blackmatter
  ];

  home.username = user;
  home.homeDirectory = home;

  home.sessionVariables = {
    EDITOR = "vim";
    AWS_REGION = "us-west-2";
    AWS_DEFAULT_REGION = "us-west-2";
    AWS_PROFILE = "pinger-organization";
  };

  blackmatter.programs.nvim.enable = true;
  blackmatter.shell.enable = true;
}
