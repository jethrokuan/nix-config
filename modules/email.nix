{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    pass
    isyncUnstable
    msmtp
    notmuch
  ];

  systemd.user =  {
    services = {
      mbsync = {
        description = "Mailbox syncronization";

  	    serviceConfig = {
  	      Type = "oneshot";
  	      ExecStart = "${pkgs.isyncUnstable}/bin/mbsync -aq";
  	    };

  	    path = with pkgs; [gawk gnupg pass];

  	    after = [ "network-online.target" "gpg-agent.service" ];
        wantedBy = [ "default.target" ];
      };
    };

    timers = {
      mbsync = {
        description = "Mailbox syncronization";

        timerConfig = {
          OnCalendar = "*:0/5";
          Persistent = "true";
        };
        wantedBy = [ "timers.target" ];
      };
    };
  };
}
