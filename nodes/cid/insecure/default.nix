# settings related to permitting insecure packages and values
{ configs, pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config.permittedInsecurePackages =
    [
      "python2.7-pyjwt-1.7.1"
      "python-2.7.18.6"
      "python2.7-certifi-2021.10.8"
      "openssl-1.1.1u"
    ];
}

