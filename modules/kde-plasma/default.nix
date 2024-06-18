{ config, lib, pkgs, ... }:
{
	imports =
		[
			#./dconf.nix
		];
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

	programs.dconf.enable = true;

	environment.systemPackages = with pkgs; [
		keepassxc
		kdePackages.kate
		kdePackages.discover
		# libsForQt5.kontact
		# libsForQt5.kdepim-addons
		# libsForQt5.kdepim-runtime
		# libsForQt5.akonadi
		# libsForQt5.merkuro
  	];

  	programs.kdeconnect = {
		enable = true;
	};

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
