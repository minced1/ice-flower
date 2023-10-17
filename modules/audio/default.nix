{ config, lib, pkgs, ... }:
{
	imports = [
		./pipewire.nix
		./music-production.nix
		./yabridge.nix
	];
}
