{ pkgs, lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig
}: {
  home.files = {
    "code/self/ltk".source = pkgs.fetchFromGitHub {
      owner = "luisfelipemourapereira";
      repo = "ltk";
      rev = "master";
      sha256 = "d2428752bf2d2c530b520f3401dfbb26805cbbd7184d3bc1448562db17d43922";
    };
  };
}
