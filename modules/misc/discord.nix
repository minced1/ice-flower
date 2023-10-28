{ config, lib, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		(discord.override {
			withVencord = false;
			withOpenASAR = false;
		})
		#ripcord
		revolt-desktop
	];


}
