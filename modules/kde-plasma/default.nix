{ config, lib, pkgs, ... }:
{
	# Enable the GNOME Desktop Environment.
	services.xserver.displayManager.sddm.enable = true;
	services.xserver.desktopManager.plasma5.enable = true;

	environment.systemPackages = with pkgs; [
		fragments
		gnome.gnome-software
		gnome-builder
		gnome.dconf-editor
		#celeste

		gnomeExtensions.rounded-window-corners
	];

	programs.kdeconnect = {
		enable = true;
		package = pkgs.gnomeExtensions.gsconnect;
	};
	environment.gnome.excludePackages = (with pkgs; [
		gnome-photos
		gnome-tour
		gnome-connections
	]) ++ (with pkgs.gnome; [
		cheese
		gnome-music
		totem
		simple-scan
		baobab
		file-roller
		seahorse
	]);
}
