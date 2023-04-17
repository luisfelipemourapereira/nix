{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      boot.enable = mkEnableOption "boot";
      boot.rai.enable = mkEnableOption "boot.rai";
      boot.plo.enable = mkEnableOption "boot.plo";
    };
  };

  config =
    mkMerge [
			(mkIf cfg.boot.enable {
				boot.kernel.sysctl."kernel.unprivileged_userns_clone" = "1";
				# boot.initrd.cgroups = {
				# 	supportUserCgroups = true;
				# 	userCgroups = {
				# 		# permit nomad user to manager cgroups
				# 		"nomad" = true;
				# 	};
				# };
			})

      (mkIf cfg.boot.rai.enable {
				blackmatter.boot.enable = true;

        # enable virtualization inside of virtualization
        # https://nixos.wiki/wiki/Libvirt
        boot.extraModprobeConfig = "options kvm_intel nested=1";
        boot.crashDump.enable = false;
        boot.crashDump.kernelParams = [ "1" "boot.shell_on_fail" ];
        boot.crashDump.reservedMemory = "128M";
        boot.enableContainers = true;
        boot.binfmt.emulatedSystems = [ ];
        boot.binfmt.registrations = { };
        boot.extraSystemdUnitPaths = [ ];
        boot.growPartition = false;
        boot.hardwareScan = true;
        boot.cleanTmpDir = true;
        boot.devShmSize = "50%";
        boot.devSize = "5%";
        boot.initrd.enable = !config.boot.isContainer;
        boot.loader.grub.enable = true;
        boot.loader.grub.version = 2;
        boot.loader.grub.devices = [ "/dev/nvme0n1" ];
      })

      (mkIf cfg.boot.plo.enable {
				blackmatter.boot.enable = true;

        # enable virtualization inside of virtualization
        # https://nixos.wiki/wiki/Libvirt
        boot.extraModprobeConfig = "options kvm_intel nested=1";
        boot.crashDump.enable = false;
        boot.crashDump.kernelParams = [ "1" "boot.shell_on_fail" ];
        boot.crashDump.reservedMemory = "128M";
        boot.enableContainers = true;
        boot.binfmt.emulatedSystems = [ ];
        boot.binfmt.registrations = { };
        boot.extraSystemdUnitPaths = [ ];
        boot.growPartition = false;
        boot.hardwareScan = true;
        boot.cleanTmpDir = true;
        boot.devShmSize = "50%";
        boot.devSize = "5%";
        boot.initrd.enable = !config.boot.isContainer;
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;
      })
    ];
}
