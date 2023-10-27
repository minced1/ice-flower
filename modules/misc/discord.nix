{ config, lib, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		(discord.override {
			withVencord = true;
			withOpenASAR = true;
		})
		#ripcord
		revolt-desktop
	];
}
