{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];


  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LANG = "en_US.UTF-8";
    LANGUAGE = "en_US:en";
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_DK.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_DK.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;




  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.basalt = {
    isNormalUser = true;
    description = "basalt";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

#  programs.firefox.enable = true;
  
  nixpkgs.config.allowUnfree = true;
  
  home-manager = {
    extraSpecialArgs = { inherit inputs;};
    users = {
      "basalt" = import ../home.nix;
    };

  };

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    tree
    nixpkgs-fmt
  ];

  system.stateVersion = "23.11"; # Did you read the comment?

}
