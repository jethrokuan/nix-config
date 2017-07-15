{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    weechat

    # Python packages
    python27Full
    python27Packages.websocket_client # wee-slack
  ];
}
