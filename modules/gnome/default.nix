{ config, lib, pkgs, ... }:
{

	# Enable the X11 windowing system.
	services.xserver.enable = true;
	# Enable the GNOME Desktop Environment.
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
	services.xserver.excludePackages = [ pkgs.xterm ];

	# Enable flatpak
	services.flatpak.enable = true;
	xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [
 			xdg-desktop-portal-kde
			# xdg-desktop-portal-gtk
		];
	};

	environment.systemPackages = with pkgs; [
		gnome.gnome-software
		gnomeExtensions.caffeine
		gnomeExtensions.forge
		celluloid
	];

	programs.kdeconnect = {
		enable = true;
		package = pkgs.gnomeExtensions.gsconnect;
	};

	environment.gnome.excludePackages = (with pkgs; [
		gnome-tour
		gnome-connections
	]) ++ (with pkgs.gnome; [
		geary
		gnome-music
		epiphany
		totem
		simple-scan
		baobab
		file-roller
		seahorse
	]);
}
