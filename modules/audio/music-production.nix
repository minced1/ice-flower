{ config, lib, pkgs, ... }:

{
	# Enable musnix tweaks
	musnix.enable = true;

	environment.systemPackages = with pkgs; [
		ardour
		lsp-plugins
		calf
		sfizz
		drumgizmo
		distrho
		#airwindows-lv2
		x42-plugins
		mda_lv2
		#setbfree
	];
}
