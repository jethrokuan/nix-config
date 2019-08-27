{ config, ... }:

{
  config.services.syncthing = {
    enable = true;
    user = "jethro";
    dataDir = "/home/jethro/";
    openDefaultPorts = true;
    declarative  = {
      overrideDevices = false;
    };
  };
}
