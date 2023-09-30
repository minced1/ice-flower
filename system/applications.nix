  { config, lib, pkgs, ... }:
  {
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