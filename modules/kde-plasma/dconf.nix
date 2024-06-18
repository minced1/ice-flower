# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.gvariant;

{
  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        #lockAll = true; # prevents overriding

        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          cursor-size = 24;
          cursor-theme = "breeze_cursors";
          font-antialiasing = "rgba";
          font-name = "Noto Sans";
          gtk-theme = "adw-gtk3";
          scaling-factor = mkUint32 1;
          text-scaling-factor = 1.0;
          toolbar-style = "text";
          toolkit-accessibility = false;
        };

        "org/gnome/desktop/peripherals/mouse" = {
          middle-click-emulation = true;
        };

        "org/gnome/desktop/wm/preferences" = {
          button-layout = "appmenu:close";
        };
      }
    ];
  };
}
