{config, pkgs, ...}:
{
  programs.adb.enable = true;
  users.users.jethro.extraGroups = ["adbusers"];

  environment.systemPackages = with pkgs; [
    android-studio
  ];
}
