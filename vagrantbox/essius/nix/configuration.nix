# nix configuration for essius machine
{ confg, pkgs, ... }: {
  users.users.vagrant.isNormalUser = true;
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
