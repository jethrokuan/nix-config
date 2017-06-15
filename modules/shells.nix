{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    # urxvt
    rxvt_unicode-with-plugins
    urxvt_font_size
    urxvt_perl
    urxvt_tabbedex

    # shells
    bash
  ];

  environment.shells = [
    "${pkgs.bash}/bin/bash"
  ];
  
  users.defaultUserShell = "/run/current-system/sw/bin/bash";
}
