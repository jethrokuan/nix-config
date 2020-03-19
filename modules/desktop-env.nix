{ config, lib, pkgs, ... }:

let emacs = import ./emacs.nix { inherit pkgs; };
in {
  services.xserver.windowManager.session = lib.singleton {
    name = "exwm";
    start = ''
    ${emacs}/bin/emacs --daemon -f exwm-enable
    ${emacs}/bin/emacsclient -c
    '';
  };

  environment.systemPackages =
    ([emacs] ++
     (with pkgs; [
       imagemagick
       git
       ripgrep
       coreutils
       fd
       clang
       texlive.combined.scheme-full
     ]));
}
