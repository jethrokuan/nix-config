{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ratpoison
    nitrogen
    wmname
  ];

  services.xserver.windowManager.default = "myRatpoison";
  services.xserver.windowManager.session = [
    {
      manage = "window";
      name = "myRatpoison";
      start = ''
        ${pkgs.wmname}/bin/wmname LG3D &
        ${pkgs.nitrogen}/bin/nitrogen --restore &
        ${pkgs.ratpoison}/bin/ratpoison &
        waitPID=$!
      '';
    }
  ];
}
