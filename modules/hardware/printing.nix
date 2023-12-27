{ config, lib, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		epson-escpr
	];

	# Enable CUPS to print documents.
	services.printing = {
		enable = true;
		drivers = [ pkgs.epson-escpr ];
	};

	services.avahi.nssmdns = true;
}
 

