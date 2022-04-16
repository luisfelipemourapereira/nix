{ lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig }: {
  home.sessionVariables = {
    EDITOR = "neovim";
    LC_ALL = "en_IN.UTF-8";
    LANG = "en_IN.UTF-8";
    AWS_REGION = "us-east-1";
    AWS_PROFILE = "pleme";
  };
}
