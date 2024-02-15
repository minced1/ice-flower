{ config, lib, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		python3
		python311Packages.pip
	];
}
