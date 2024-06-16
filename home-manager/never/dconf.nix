# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "apps/seahorse/listing" = {
      keyrings-selected = [ "openssh:///home/never/.ssh" ];
    };

    "apps/seahorse/windows/key-manager" = {
      height = 605;
      width = 1181;
    };

    "ca/desrt/dconf-editor" = {
      bookmarks = [ "/org/gnome/desktop/wm/" ];
      saved-pathbar-path = "/org/gnome/desktop/interface/monospace-font-name";
      saved-view = "/org/gnome/desktop/interface/";
      show-warning = false;
      window-height = 500;
      window-is-maximized = false;
      window-width = 941;
    };

    "de/haeckerfelix/Fragments" = {
      client-last-connection = "00000000-0000-0000-0000-000000000000";
      window-height = 700;
      window-width = 900;
    };

    "io/github/celluloid-player/celluloid" = {
      always-use-floating-controls = true;
    };

    "io/github/celluloid-player/celluloid/window-state" = {
      height = 1126;
      loop-playlist = false;
      maximized = false;
      playlist-width = 250;
      show-playlist = false;
      volume = 0.98;
      width = 1920;
    };

    "org/freedesktop/folks" = {
      primary-store = "eds:system-address-book";
    };

    "org/freedesktop/tracker/miner/files" = {
      index-recursive-directories = [ "&DESKTOP" "&DOCUMENTS" "&MUSIC" "&PICTURES" "&VIDEOS" "&DOWNLOAD" "/" ];
    };

    "org/gnome/desktop/a11y/applications" = {
      screen-reader-enabled = false;
    };

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

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      middle-click-emulation = true;
    };

    "org/gnome/desktop/sound" = {
      theme-name = "ocean";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "icon:minimize,maximize,close";
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/shell/extensions/caffeine" = {
      indicator-position-max = 2;
    };

    "org/gnome/shell/extensions/gsconnect" = {
      devices = [];
    };

    "org/gnome/shell/world-clocks" = {
      locations = [];
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      selected-color = mkTuple [ true 0.2078431397676468 0.5176470875740051 0.8941176533699036 1.0 ];
    };

    "org/gtk/gtk4/settings/debug" = {
      inspector-warning = true;
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 228;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "descending";
      type-format = "category";
      view-type = "list";
      window-size = mkTuple [ 1519 807 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 201;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 26 23 ];
      window-size = mkTuple [ 1098 651 ];
    };

    "org/tractor" = {
      accept-connection = true;
      bridge-type = 1;
      exit-node = "ww";
    };

    "org/virt-manager/virt-manager" = {
      manager-window-height = 497;
      manager-window-width = 550;
    };

    "org/virt-manager/virt-manager/conns/qemu:system" = {
      window-size = mkTuple [ 800 600 ];
    };

    "org/virt-manager/virt-manager/vmlist-fields" = {
      disk-usage = false;
      network-traffic = false;
    };

    "system/locale" = {
      region = "de_DE.UTF-8";
    };

    "system/proxy" = {
      ignore-hosts = [ "localhost" "127.0.0.0/8" "::1" "192.168.0.0/16" "10.0.0.0/8" "172.16.0.0/12" ];
      mode = "none";
    };

    "system/proxy/socks" = {
      host = "127.0.0.1";
      port = 9052;
    };

  };
}
