{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    # shells
    bash
    fish
  ];

  environment.shells = [
    "${pkgs.bash}/bin/bash"
    "${pkgs.fish}/bin/fish"
  ];

  programs.fish.enable = true;
  services.urxvtd.enable = true;

  users.defaultUserShell = "/run/current-system/sw/bin/fish";
}
