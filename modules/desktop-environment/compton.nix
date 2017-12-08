{config, pkgs, ...}:
{
  services.compton = {
    enable = true;
    shadow = false;
    extraOptions = ''
      blur-background = true;
      blur-background-frame = true;
      blur-kern = "7x7box";
    '';
  };
}
