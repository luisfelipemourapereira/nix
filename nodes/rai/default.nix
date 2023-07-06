{ outputs, ... }:
{
  imports = [ outputs.nixosModules.blackmatter ];

  nixpkgs.config.allowUnfree = true;

  blackmatter.host = "rai";
  blackmatter.dns.enable = true;
  blackmatter.sops.enable = true;
  blackmatter.boot.rai.enable = true;
  blackmatter.users.enable = true;
  blackmatter.fonts.enable = true;
  blackmatter.global.enable = true;
  blackmatter.xserver.enable = true;
  blackmatter.display.enable = true;
  blackmatter.pipewire.enable = true;
  blackmatter.services.enable = true;
  blackmatter.packages.enable = true;
  blackmatter.programs.enable = true;
  blackmatter.networking.enable = true;
  blackmatter.hardware.rai.enable = true;
  blackmatter.virtualization.enable = true;
}
