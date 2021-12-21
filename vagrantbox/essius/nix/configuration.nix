# nix configuration for essius machine
{ confg, pkgs, ... }: {
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
