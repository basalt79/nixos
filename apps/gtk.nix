{ config, lib, pkgs, ... }:

with lib.hm.gvariant;
{
  # https://nixos.org/manual/nixos/stable/#sec-gnome-gsettings-overrides
  # https://nix-community.github.io/home-manager/options.xhtml#opt-dconf.settings
  # https://determinate.systems/posts/declarative-gnome-configuration-with-nixos
  # https://hoverbear.org/blog/declarative-gnome-configuration-in-nixos/
  #   run `dconf watch /` and set whatever option you're looking to declaratively persist, and observe the output
  dconf = {
    enable = true;
    settings = {

      "org/gnome/shell" = {
        disable-user-extensions = false;
        # `gnome-extensions list` for a list
        enabled-extensions = [
          "dash-to-dock@micxgx.gmail.com"
        ];
      };

      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "list-view";
        date-time-format = "detailed";
      };

      # i need to define the key upfront to define the binding later
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>e";
        command = "/usr/bin/env nautilus";
        name = "File Manager";
      };      

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Super>Return";
        command = "/usr/bin/env kgx";
        name = "Terminal";
      };
      
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
        show-battery-percentage = true;
      };

      "org/gnome/desktop/session" = {
        idle-delay = mkUint32 900;
      };

      "org/gnome/shell" = {
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "firefox.desktop" 
          ];
      };
  
      "org/gnome/shell/extensions/dash-to-dock" = {
        dock-position = "LEFT";
        height-fraction = 0.65;
        apply-custom-theme = true;
        custom-theme-shrink = true;
        show-trash = true;
        dash-max-icon-size = 32;
        dock-fixed = true;
        extend-height = true;
      };

      "org/gnome/settings-daemon/plugins/power" = {
        sleep-inactive-battery-timeout = mkUint32 900;
        sleep-inactive-ac-type = "suspend";
        sleep-inactive-ac-timeout = mkUint32 1200;
        power-button-action = "hibernate";
        power-saver-profile-on-low-battery = false;
      };
      "org/gnome/desktop/peripherals/keyboard" = {
        delay = mkUint32 175;
        repeat-interval = mkUint32 18;
        repeat = true;
      };
      "org/gnome/desktop/sound" = {
        event-sounds = false;
      };
    };
  };
}
