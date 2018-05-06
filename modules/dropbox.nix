{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    dropbox-cli
  ];

  systemd.user.services.dropbox = {
    enable = true;
    description = "Dropbox service";
    after = [ "network.target" ];
    wantedBy = [ "default.target" ];
    path = with pkgs; [dropbox-cli];
    serviceConfig = {
      Type = "forking";
      PIDFile = "%h/.dropbox/dropbox.pid";
      ExecStart = "${pkgs.dropbox-cli}/bin/dropbox start";
      ExecStop = "${pkgs.dropbox-cli}/bin/dropbox stop";
    };
  };
}
