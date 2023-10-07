{ config, lib, pkgs, ... }:

{
  # Enable musnix tweaks
  musnix.enable = true;

  environment.systemPackages = with pkgs; [
    ardour
    lsp-plugins
    calf
    sfizz
    drumgizmo
    distrho
    airwindows-lv2
  ];
}
