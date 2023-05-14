# ani is macos ventura
# https://daiderd.com/nix-darwin/manual/index.html#sec-options
{ config, pkgs, inputs, ... }:
{
  imports = [
    ./packages
    ./services
    ./insecure
    ./keyboard
    ./display
    ./global
    ./users
    ./shell
  ];
}
