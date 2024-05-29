{ config, lib, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		texlive.combined.scheme-medium
		typst
	];
}
