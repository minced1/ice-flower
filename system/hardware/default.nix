{ config, lib, pkgs, ... }:
{
	imports = [
		./nvidia.nix
		./mount.nix
		./printing.nix
	];
}
