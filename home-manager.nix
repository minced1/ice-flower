{ config, lib, pkgs, ... }:
{
	home-manager.nixosModules.home-manager {
		home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;
		home-manager.users.never = import ./home-manager/never/home.nix;
	}
}