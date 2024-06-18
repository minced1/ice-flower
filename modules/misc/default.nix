{ config, lib, pkgs, ... }:
{
	imports =
		[
			#./python.nix
			./jellyfin.nix
			./steam.nix
			#./discord.nix
			./texlive.nix
			./game-developement.nix
		];

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		git
		git-crypt
		gnupg
		# pinentry-gnome
		dconf2nix
		curl
		meson
		rubber
		ninja
		gnumake
		binutils

		vlc
		#firefox
		#thunderbird
	];

	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = true;
	};
}
