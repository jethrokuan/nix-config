{config, pkgs, ...}:

let
  fluminurs = pkgs.callPackage ../custom/fluminurs.nix {} ;
in
{
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
    stow
    tree
    wget
    xclip
    xdg_utils

    fluminurs # API for Luminus
  ];
}
