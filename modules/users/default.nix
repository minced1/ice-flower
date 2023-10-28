{ config, lib, pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.never = {
    isNormalUser = true;
    description = "Never";
    extraGroups = [ "networkmanager" "wheel" "audio"];
    packages = with pkgs; [
    ];
  };
}