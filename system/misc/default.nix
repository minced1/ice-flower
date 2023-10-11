{ config, lib, pkgs, ... }:
{
  imports =
    [ 
      ./python.nix
      ./plex.nix
    ];
	# Enable flatpak
	services.flatpak.enable = true;

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
	#  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	#  wget
	  git
	  git-crypt
	  gnupg
	  pinentry-gnome
	  curl
	];
}
