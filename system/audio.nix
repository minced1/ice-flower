{ config, lib, pkgs, ... }:

{
  # Enable musnix tweaks
  musnix.enable = true;

	environment.systemPackages = with pkgs; [
		ardour
    lsp-plugins
    calf
    artyFX
    sfizz
    drumgizmo
    distrho
	];
}