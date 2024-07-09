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
	services.xserver.excludePackages = [ pkgs.xterm ];

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
		libreoffice-qt6
		kdePackages.filelight
		kdePackages.kate
		kdePackages.discover
		kdePackages.dragon
		libsForQt5.polonium
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
