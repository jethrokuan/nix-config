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
    fish
  ];

  environment.shells = [
    "${pkgs.bash}/bin/bash"
    "${pkgs.fish}/bin/fish"
  ];
  
  users.defaultUserShell = "/run/current-system/sw/bin/fish";
}
