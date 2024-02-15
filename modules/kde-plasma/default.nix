{ config, lib, pkgs, ... }:
{
	# Enable the X11 windowing system.
	services.xserver.enable = true;
	services.xserver.displayManager.defaultSession = "plasmawayland";
	# Enable the KDE Plasma Desktop Environment.
	services.xserver.displayManager.sddm.enable = true;
	services.xserver.desktopManager.plasma5.enable = true;
	
# 	nixpkgs.config.permittedInsecurePackages = [
# 		"qtwebkit-5.212.0-alpha4"
# 	];

	environment.systemPackages = with pkgs; [
		libsForQt5.falkon
		libsForQt5.kate
		libqalculate
		kile
		kbibtex
		tikzit
		keepassxc
# 		calligra
		translate-shell

		libsForQt5.discover
 		libsForQt5.kontact
 		libsForQt5.kdepim-addons
 		libsForQt5.kdepim-runtime
# 		libsForQt5.akonadi
# 		libsForQt5.merkuro
  	];

  	programs.kdeconnect = {
		enable = true;
	};
	
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
