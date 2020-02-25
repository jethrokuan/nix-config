{config, pkgs, ...}:

let
  fluminurs = pkgs.callPackage ../custom/fluminurs.nix {} ;
in
{
  services.lorri.enable = true;
  environment.systemPackages = with pkgs; [
    aspell
    aspellDicts.en
    direnv
    fd
    file
    fzf
    gitAndTools.gitFull
    gvfs
    less
    maim
    networkmanagerapplet
    ntfs3g
    pass
    ripgrep
    starship
    stow
    tree
    wget
    xclip
    xdg_utils

    # Screencasting
    simplescreenrecorder
    gifsicle
    scrot
    imagemagick

    fluminurs # API for Luminus
  ];
}
