{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    wine-staging
  ];
}
