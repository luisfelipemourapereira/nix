{ outputs, ... }:
let
  user = "t3rro";
  email = "t3rro@protonmail.com";
in
{
  imports = [
    ../../common/global
    outputs.homeManagerModules.blackmatter
  ];
  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.sessionVariables = {
    EDITOR = "vim";
    AWS_REGION = "us-east-1";
    AWS_DEFAULT_REGION = "us-east-1";
    AWS_PROFILE = "pleme";
  };

  blackmatter = {
    gitconfig = {
      inherit user email;
      enable = true;
    };
  };

  programs.ssh.hashKnownHosts = false;
  home.file.".ssh/config".text = ''
    Host *
      StrictHostKeyChecking no
    	IdentitiesOnly yes
    	IdentityFile ~/.ssh/id_rsa
    	'';
  # TODO: eval for removal
  # home.file.".ssh/known_hosts".source = ./ssh/known_hosts;
}
