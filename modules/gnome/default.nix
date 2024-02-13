{ config, lib, pkgs, ... }:
{
	# Enable the X11 windowing system.
	services.xserver.enable = true;
	# Enable the GNOME Desktop Environment.
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
	services.xserver.excludePackages = [ pkgs.xterm ];

	environment.systemPackages = with pkgs; [
		gnome.gnome-software
		gnomeExtensions.caffeine
		gnomeExtensions.forge
	];

	programs.kdeconnect = {
		enable = true;
		package = pkgs.gnomeExtensions.gsconnect;
	};
	environment.gnome.excludePackages = (with pkgs; [
		gnome-tour
		gnome-connections
	]) ++ (with pkgs.gnome; [
		#gnome-music
		epiphany
		totem
		simple-scan
		baobab
		file-roller
		seahorse
	]);
}
