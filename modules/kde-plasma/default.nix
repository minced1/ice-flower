{ config, lib, pkgs, ... }:
{
	# Enable the X11 windowing system.
	services.xserver.enable = true;
	# services.xserver.displayManager.defaultSession = "plasmawayland";
	# Enable the GNOME Desktop Environment.
	services.xserver.displayManager.sddm.enable = true;
	services.xserver.desktopManager.plasma5.enable = true;

	environment.plasma5.excludePackages = with pkgs.libsForQt5; [
		# elisa
		# gwenview
		# okular
		# oxygen
		# khelpcenter
		# konsole
		# plasma-browser-integration
		# print-manager
	];
}
