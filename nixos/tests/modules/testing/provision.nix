# @EXAMPLE@: relative nixpkgs import

################################################################################
# nixos test that evokes provisioning for a nixos node
################################################################################
import "${<nixpkgs>}/nixos/tests/make-test-python.nix" (
  { pkgs, ... }: {
    name = "provision";
    testScript = ''
      print("hi all")
    '';
    nodes.machine = {
      imports = [ ../../../../modules/edge/blackmatter.nix ];
      edge.blackmatter.enable = false;
      edge.blackmatter.boot.enable = false;
      edge.blackmatter.virtualization.enable = false;
      edge.blackmatter.cli.enable = false;
      edge.blackmatter.ssh.enable = false;
      edge.blackmatter.wireless.enable = false;
      edge.blackmatter.vagrant.enable = false;
      edge.blackmatter.dotfile.enable = false;
      edge.blackmatter.sites.tap.enable = false;
      edge.blackmatter.desktop.enable = false;
    };
  }
)
