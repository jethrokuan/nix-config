{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    steam
  ];
}
