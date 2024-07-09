{ config, lib, pkgs, ... }:
{
	# Enable the X11 windowing system.
    services.xserver.enable = true;
    services.xserver.desktopManager.pantheon.enable = true;
    services.xserver.excludePackages = [ pkgs.xterm ];

    # services.pantheon.apps.enable = false;

	# Enable flatpak
	services.flatpak.enable = true;
	xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [
			# xdg-desktop-portal-kde
			#xdg-desktop-portal-gtk
		]; 
	};

	programs.dconf.enable = true;

	environment.systemPackages = with pkgs; [
		pantheon.epiphany
  	];


	programs.firefox = {
		enable = true;
		#nativeMessagingHosts.packages = [ pkgs.kdePackages.plasma-browser-integration ];
		preferences = {
			"widget.use-xdg-desktop-portal.file-picker" = 1;
		};
	};

	programs.thunderbird = {
		enable = true;
		#nativeMessagingHosts.packages = [ pkgs.kdePackages.plasma-browser-integration ];
		preferences = {
			"widget.use-xdg-desktop-portal.file-picker" = 1;
		};
	};
}
