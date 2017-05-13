{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
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
