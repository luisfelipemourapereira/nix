{ config, inputs, lib, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  options = {
    blackmatter = {
      sops.enable = mkEnableOption "sops";
    };
  };

  config = mkMerge [
    (mkIf cfg.sops.enable {
      sops.defaultSopsFile = ../../../../secrets/default.yaml;

      sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      sops.age.keyFile = "/var/lib/sops-nix/key.txt";
      sops.age.generateKey = false;

      sops.secrets."auth.txt" = {
        path = "/etc/openvpn/auth.txt";
        sopsFile = ../../../../secrets/tapvpn.yaml;
      };

      sops.secrets."luis/aws/credentials" = {
        owner = config.users.users.luis.name;
        path = "/home/luis/.aws/credentials";
        sopsFile = ../../../../secrets/luis/aws.yaml;
      };

      sops.secrets."luis/aws/config" = {
        owner = config.users.users.luis.name;
        path = "/home/luis/.aws/config";
        sopsFile = ../../../../secrets/luis/aws.yaml;
      };

      sops.secrets."t3rro/aws/credentials" = {
        owner = config.users.users.t3rro.name;
        path = "/home/t3rro/.aws/credentials";
        sopsFile = ../../../../secrets/t3rro/aws.yaml;
      };

      sops.secrets."t3rro/gh/env/GH_TOKEN" = {
        owner = config.users.users.t3rro.name;
        path = "/home/t3rro/.config/gh/env/GH_TOKEN";
        sopsFile = ../../../../secrets/t3rro/github.yaml;
      };

      sops.secrets."luis/ssh/id_rsa" = {
        mode = "0400";
        owner = config.users.users.luis.name;
        path = "/home/luis/.ssh/id_rsa";
        sopsFile = ../../../../secrets/luis/ssh.yaml;
      };

      sops.secrets."luis/pinger/vpn/username" = {
        mode = "0755";
        owner = config.users.users.luis.name;
        path = "/secrets/pinger/vpn/username";
        sopsFile = ../../../../secrets/luis/pinger-vpn.yaml;
      };

      sops.secrets."luis/pinger/vpn/password" = {
        mode = "0755";
        owner = config.users.users.luis.name;
        path = "/secrets/pinger/vpn/password";
        sopsFile = ../../../../secrets/luis/pinger-vpn.yaml;
      };

      sops.secrets."t3rro/ssh/id_rsa" = {
        mode = "0400";
        owner = config.users.users.t3rro.name;
        path = "/home/t3rro/.ssh/id_rsa";
        sopsFile = ../../../../secrets/t3rro/ssh.yaml;
      };

      sops.secrets."t3rro/ssh/id_rsa_pub" = {
        mode = "0400";
        owner = config.users.users.t3rro.name;
        path = "/home/t3rro/.ssh/id_rsa.pub";
        sopsFile = ../../../../secrets/t3rro/ssh.yaml;
      };

      sops.secrets."luis/bundle/config" = {
        owner = config.users.users.luis.name;
        path = "/home/luis/.bundle/config";
        sopsFile = ../../../../secrets/luis/bundle.yaml;
      };

      sops.secrets."luis/gem/credentials" = {
        owner = config.users.users.luis.name;
        mode = "0600";
        path = "/home/luis/.gem/credentials";
        sopsFile = ../../../../secrets/luis/gem.yaml;
      };

      sops.secrets."t3rro/gem/credentials" = {
        owner = config.users.users.t3rro.name;
        mode = "0600";
        path = "/home/t3rro/.gem/credentials";
        sopsFile = ../../../../secrets/t3rro/gem.yaml;
      };

      sops.secrets."luis/gobang/config.toml" = {
        owner = config.users.users.luis.name;
        path = "/home/luis/.config/gobang/config.toml";
        sopsFile = ../../../../secrets/luis/gobang.yaml;
      };

      sops.secrets."luis/system/password" = {
        sopsFile = ../../../../secrets/luis/system.yaml;
        neededForUsers = true;
      };
    })
  ];
}
