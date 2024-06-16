{ config, lib, pkgs, ... }:
{
	# Enable the X11 windowing system.
	services.xserver.enable = true;
	# Enable the KDE Plasma Desktop Environment.
	services.displayManager.sddm.enable = true;
	services.desktopManager.plasma6.enable = true;

# 	nixpkgs.config.permittedInsecurePackages = [
# 		"qtwebkit-5.212.0-alpha4"
# 	];

	# Enable flatpak
	services.flatpak.enable = true;
	xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [
			# xdg-desktop-portal-kde
			xdg-desktop-portal-gtk
		];
	};
	fonts.fontDir.enable = true;

	programs.dconf.enable = true;

	environment.systemPackages = with pkgs; [
		kdePackages.kate
		keepassxc
		cantarell-fonts
		# libsForQt5.discover
		# libsForQt5.kontact
		# libsForQt5.kdepim-addons
		# libsForQt5.kdepim-runtime
		# libsForQt5.akonadi
		# libsForQt5.merkuro
  	];

  	programs.kdeconnect = {
		enable = true;
	};

	environment.plasma6.excludePackages = with pkgs.kdePackages; [
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
