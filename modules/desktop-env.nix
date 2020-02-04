{ config, lib, pkgs, ... }:

let emacs = import ./emacs.nix { inherit pkgs; };
in {
  services.xserver.windowManager.session = lib.singleton {
    name = "exwm";
    start = ''
      ${emacs}/bin/emacs --eval '(progn (server-start) (exwm-enable))'
    '';
  };

  environment.systemPackages = [ emacs ];
}
