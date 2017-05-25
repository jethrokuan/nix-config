{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    # urxvt
    rxvt_unicode-with-plugins
    urxvt_font_size
    urxvt_perl
    urxvt_tabbedex

    # shells
    fish
    bash
  ];

  environment.shells = [
    "${pkgs.fish}/bin/fish"
    "${pkgs.bash}/bin/bash"
  ];
  
  programs.fish.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/fish";
}
