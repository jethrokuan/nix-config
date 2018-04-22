{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nitrogen
    wmname
  ];

  services.xserver.desktopManager.gnome3.enable =true;
  services.xserver.desktopManager.default = "gnome3";

  services.xserver.windowManager.default = "myRatpoison";
  services.xserver.windowManager.session = [
    {
      manage = "desktop";
      name = "myRatpoison";
      start = ''
        ${pkgs.wmname}/bin/wmname LG3D &
        ${pkgs.emacs}/bin/emacs --daemon &
        ${pkgs.dropbox}/bin/dropbox start &
        ${pkgs.nitrogen}/bin/nitrogen --restore &
        ${pkgs.ratpoison}/bin/ratpoison &
        waitPID=$!
      '';
    }
  ];
}
