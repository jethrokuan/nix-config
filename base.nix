{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      # Include desktop specific configuration
      ./extra.nix

      ./modules/desktop-env.nix
      ./modules/system-util.nix
      ./modules/networking.nix
      ./modules/fonts.nix
      ./modules/redshift.nix
      ./modules/shells.nix
      ./modules/browser.nix
      ./modules/dropbox.nix
      ./modules/pdf.nix
      ./modules/archiver.nix
      ./modules/udiskie.nix
      ./modules/udev.nix
      ./modules/email.nix
      ./modules/media.nix

      ./modules/overlays.nix
    ];

  nix.nixPath = [
    "nixpkgs=/home/jethro/nix-config/nixpkgs"
    "nixos-config=/home/jethro/nix-config/base.nix"
  ];

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };
  hardware.opengl.driSupport32Bit = true;
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
    extraGroups = ["wheel" "networkmanager" "uucp" "fuse" "video"];
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "19.10";

  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };
}
