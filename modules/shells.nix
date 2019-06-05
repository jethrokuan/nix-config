{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    # shells
    bash
    fish
    alacritty
  ];

  environment.shells = [
    "${pkgs.bash}/bin/bash"
    "${pkgs.fish}/bin/fish"
  ];

  programs.fish.enable = true;

  users.defaultUserShell = "/run/current-system/sw/bin/fish";
}
