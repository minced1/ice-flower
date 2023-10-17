{ config, lib, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.plex
  ];
  
  services.plex = {
    enable = true;
    openFirewall = true;
  };
}
