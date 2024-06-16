{ config, lib, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		godot_4
		aseprite
		blender
		gimp
		inkscape
		krita
	];
}
