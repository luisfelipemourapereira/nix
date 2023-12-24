# settings related to permitting insecure packages and values
{ configs, pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.permittedInsecurePackages =
    [
      "python2.7-pyjwt-1.7.1"
      "electron-25.9.0"
    ];
}
