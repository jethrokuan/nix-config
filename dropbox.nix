{ config, pkgs, ... }:

{
  systemd.user.services.dropbox = {
  description = "Dropbox";
  serviceConfig = {
      Type = "simple";
      ExecStart = pkgs.writeScript "dropbox" ''
        #! ${pkgs.bash}/bin/bash
        exec ${pkgs.dropbox}/bin/dropbox
        . ${config.system.build.setEnvironment}
      '';
      RestartSec = 3;
      Restart = "always";
    };
    wantedBy = [ "default.target" ];
  };
}
