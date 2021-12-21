{ pkgs, lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig
}: {
  home.file = {
    "code/self/ltk".source = builtins.fetchGit {
      url = "ssh://git@github.com/luisfelipemourapereira/ltk.git";
      ref = "master";
      rev = "6ed0f0328a68f38b5ce099156121bcf09cd762cd";
      # owner = "k3rni";
      # repo = "foggy";
      # rev = "fd76b28";
      # sha256 = "0lfm7kczgdlzfcc14qj8539y679lf5qcydz0xv72szn7h9wzaaiz";
      # owner = "luisfelipemourapereira";
      # repo = "ltk";
      # sha256 =
      # "d2428752bf2d2c530b520f3401dfbb26805cbbd7184d3bc1448562db17d43922";
    };
    # "code/self/ltk".source = pkgs.fetchFromGitHub {
    # # owner = "k3rni";
    # # repo = "foggy";
    # # rev = "fd76b28";
    # # sha256 = "0lfm7kczgdlzfcc14qj8539y679lf5qcydz0xv72szn7h9wzaaiz";
    # owner = "luisfelipemourapereira";
    # repo = "ltk";
    # sha256 =
    # "d2428752bf2d2c530b520f3401dfbb26805cbbd7184d3bc1448562db17d43922";
    # };
  };
}
