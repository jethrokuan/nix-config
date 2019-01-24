{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ratpoison
    nitrogen
    wmname
  ];

  services.xserver.windowManager.ratpoison.enable = true;

  services.xserver.displayManager.sessionCommands = with pkgs; lib.mkAfter
    ''
      ${wmname}/bin/wmname LG3D &
      ${nitrogen}/bin/nitrogen --restore &
    '';
}
