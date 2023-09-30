{ config, lib, pkgs, ... }:
{
	imports = [
		../hardware-configuration.nix
	];

 fileSystems."/data" = {
    device = "/dev/disk/by-uuid/c02532a2-9178-45c0-b82c-720453918860";
    fsType = "ext4";
  };
}