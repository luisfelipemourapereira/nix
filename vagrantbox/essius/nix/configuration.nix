# nix configuration for essius machine
{ confg, pkgs, ... }: {
  users.users.vagrant.isNormalUser = true;
  nix = {
    pacage = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
