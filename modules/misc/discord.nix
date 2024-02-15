{ config, lib, pkgs, ... }:
{
	environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };
	environment.systemPackages = with pkgs; [
		(discord.override {
			withVencord = false;
			withOpenASAR = false;
		})
		#ripcord
		webcord

	];
}
