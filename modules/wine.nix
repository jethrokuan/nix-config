{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    (wine-staging.override { wineBuild = "wineWow"; })
  ];
}
