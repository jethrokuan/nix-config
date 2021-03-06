{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      # Include desktop specific configuration
      ./extra.nix

      ./modules/desktop-env.nix
      ./modules/email.nix
      ./modules/fonts.nix
      ./modules/networking.nix
      ./modules/overlays.nix
      ./modules/redshift.nix
      ./modules/udiskie.nix
    ];

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  # Select internationalisation properties.
  console = {
    font = "Lat2-Terminus16";
    keyMap = "dvorak";
  };
  
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Asia/Singapore";

  powerManagement.enable = true;
  
  #Services
  services.xserver.enable = true;
  services.xserver.libinput.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "dvorak";
  services.xserver.xkbOptions = "ctrl:nocaps";
  services.openssh.enable = true;
  services.printing.enable = true;
  services.udisks2.enable = true;  
  security.sudo.enable = true;

  location = {
    latitude = 1.3521;
    longitude = 103.8198;
  };

  users.extraUsers.jethro = {
    isNormalUser = true;
    initialPassword = "password";
    uid = 1000;
    home = "/home/jethro";
    description = "Jethro Kuan";
    extraGroups = ["wheel" "networkmanager" "uucp" "fuse" "audio" "video" "docker"];
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "20.09";

  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };

  virtualisation.docker.enable = true;
  nix = {
    trustedUsers = ["root" "jethro"];
    nixPath = [
      "nixpkgs=/home/jethro/nix-config/nixpkgs"
      "nixos-config=/home/jethro/nix-config/base.nix"
      "home-manager=/home/jethro/nix-config/home-manager"
    ];
  };
  
  services.udev = {
     packages = [ pkgs.android-udev-rules ];
     extraRules = ''
     # Atmel ATMega32U4
     SUBSYSTEMS=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2ff4", MODE:="0666"
     # Atmel USBKEY AT90USB1287
     SUBSYSTEMS=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2ffb", MODE:="0666"
     # Atmel ATMega32U2
     SUBSYSTEMS=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2ff0", MODE:="0666"
     # tmk keyboard products     https://github.com/tmk/tmk_keyboard
     SUBSYSTEMS=="usb", ATTRS{idVendor}=="feed", MODE:="0666"
     '';
   };
}
