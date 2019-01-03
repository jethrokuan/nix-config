{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    pass
    gnupg
    isync
    msmtp
    notmuch
    pinentry_qt5
  ];

  programs.gnupg.agent.enable = true;

  systemd.user = {
    services.mbsync = {
      description = "Mailbox syncronization";

  	  serviceConfig = {
  	    Type = "oneshot";
  	    ExecStart = "${pkgs.isync}/bin/mbsync -aq";
  	  };

  	  path = with pkgs; [gawk gnupg pass];

  	  after = [ "network-online.target" "gpg-agent.service" ];
      wantedBy = [ "default.target" ];
    };

    timers.mbsync = {
      description = "Mailbox syncronization";

      timerConfig = {
        OnCalendar = "*:0/2";
        Persistent = "true";
      };

      wantedBy = [ "timers.target" ];
    };
  };
}
