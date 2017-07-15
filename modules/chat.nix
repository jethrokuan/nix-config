{ config, pkgs, ... }:

let
  wchat = pkgs.weechat.override {
      extraBuildInputs = [ pkgs.python27Packages.websocket_client ];
  };
in
{
  environment.systemPackages = [
    wchat
  ];
}
