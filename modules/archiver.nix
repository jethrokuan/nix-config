{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    unrar
    unzip
    xz
    zip
    gnome3.file-roller
  ];
  
}
