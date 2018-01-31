{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    # shells
    bash
    fish
    sakura
  ];

  environment.shells = [
    "${pkgs.bash}/bin/bash"
    "${pkgs.fish}/bin/fish"
  ];

  programs.fish.enable = true;
  
  users.defaultUserShell = "/run/current-system/sw/bin/fish";
}
