{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    unrar
    unzip
    xz
    zip
  ];
}
