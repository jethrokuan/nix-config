{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      # Include desktop specific configuration
      /etc/nixos/extra.nix

      ./modules/desktop-environment/ratpoison.nix

      # Modules
      ./modules/system-util.nix
      ./modules/fonts.nix
      ./modules/redshift.nix
      ./modules/shells.nix
      ./modules/emacs.nix
      ./modules/browser.nix
      ./modules/dropbox.nix
      ./modules/pdf.nix
      ./modules/archiver.nix
      ./modules/mail.nix
      ./modules/udiskie.nix
      ./modules/udev.nix
      # ./modules/chat.nix

      # Languages
      ./modules/languages/java.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_4_13;

  hardware.pulseaudio.enable = true;
  hardware.opengl.driSupport32Bit = true;
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  # Select internationalisation properties.
   i18n = {
     consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "dvorak";
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

  users.extraUsers.jethro = {
      isNormalUser = true;
      initialPassword = "password";
      uid = 1000;
      home = "/home/jethro";
      description = "Jethro Kuan";
      extraGroups = ["wheel" "networkmanager" "uucp" "fuse"];
    };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.09";

  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };
}
