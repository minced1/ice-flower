{ config, lib, pkgs, ... }:
{
	imports =
		[
			#./python.nix
			./jellyfin.nix
			./steam.nix
			#./discord.nix
			./texlive.nix
		];
	# Enable flatpak
	services.flatpak.enable = true;

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		git
		git-crypt
		gnupg
		# pinentry-gnome
		curl
		firefox
		meson
		rubber
		ninja
		gnumake
		binutils
	];

	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = true;
		pinentryFlavor = "curses";
	};
}
