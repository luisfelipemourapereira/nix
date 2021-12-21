{ lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig }: {
  home.files = {
    "code/self/ltk".source = fetchFromGitHub {
      owner = "luisfelipemourapereira";
      repo = "ltk";
      rev = "master";
      sha256 = "whateva";
    };
  };
}
