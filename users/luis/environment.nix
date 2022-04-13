{ lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig }: {
  home.sessionVariables = {
    EDITOR = "neovim";
    TERM = "alacritty";
    LC_ALL = "en_IN.UTF-8";
    LANG = "en_IN.UTF-8";
  };
}
