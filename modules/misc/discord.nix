{ config, lib, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		discord
	];

	(pkgs.discord.override {
		withVencord = true;
	})
}
