{ config, pkgs, ... }:

{
  services.xserver.windowManager.exwm = {
    enable = true;
    extraPackages = epkgs: [
      epkgs.emacs-libvterm
    ];
  };
  environment.systemPackages = with pkgs; [
    numix-cursor-theme
  ];
}
