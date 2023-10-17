{ config, lib, pkgs, ... }:
{
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.gsconnect
    gnomeExtensions.rounded-window-corners
  ];
  
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
