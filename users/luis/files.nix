{ pkgs, lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig
}: {
  home.file = {
    "code/self/ltk".source = builtins.fetchGit {
      url = "ssh://git@github.com/luisfelipemourapereira/ltk.git";
      ref = "master";
      rev = "6ed0f0328a68f38b5ce099156121bcf09cd762cd";
    };
    "code/pub/consul".source = builtins.fetchGit {
      url = "ssh://git@github.com/hashicorp/consul.git";
      ref = "master";
      rev = "09cc3338d4807b5777486aea3ff4d95431ab3abf";
    };
  };
}
