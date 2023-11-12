{ ... }:
let
  user = "ldesiqueira";
  email = "luis@pinger.com";
in
{
  imports = [ ../../common/global ];
  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.sessionVariables = {
    EDITOR = "vim";
    AWS_REGION = "us-east-1";
    AWS_DEFAULT_REGION = "us-east-1";
    AWS_PROFILE = "pinger-organization";
  };
  blackmatter = {
    gitconfig = {
      inherit user email;
      enable = true;
    };
  };
}
