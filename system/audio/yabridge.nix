{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wine-staging
    yabridge
    yabridgectl
  ];
}
