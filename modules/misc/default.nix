{ config, lib, pkgs, ... }:
{
  imports =
    [
      # ./python.nix
      ./plex.nix
      ./steam.nix
      ./discord.nix
    ];
	# Enable flatpak
	services.flatpak.enable = true;

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
	  git
	  git-crypt
	  gnupg
	  pinentry-gnome
	  curl
	  freecad
	];

	programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };
}
