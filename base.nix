{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      # Include desktop specific configuration
      /etc/nixos/extra.nix

      # DE
      ./modules/desktop_environment.nix
      
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

      # Languages
      ./modules/languages/java.nix
    ];

  hardware.opengl.driSupport32Bit = true;
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.useDHCP = false;
  # networking.wicd.enable = true;
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
  services.openssh.enable = true;
  services.printing.enable = true;

  security.sudo.enable = true;

  users.extraUsers.jethro = {
      isNormalUser = true;
      initialPassword = "password";
      uid = 1000;
      home = "/home/jethro";
      description = "Jethro Kuan";
      extraGroups = ["wheel" "networkmanager" "uucp" ];
    };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };
}
