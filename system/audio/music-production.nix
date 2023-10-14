{ config, lib, pkgs, ... }:

{
  # Enable musnix tweaks
  musnix.enable = true;

  environment.systemPackages = with pkgs; [
    lingot
    ardour
    lsp-plugins
    calf
    sfizz
    drumgizmo
    distrho
    airwindows-lv2
  ];
}
