{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    isyncUnstable
    msmtp
    notmuch
  ];
}
