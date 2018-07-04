{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    ntfs3g
    gnumake
    direnv
    wget
    aspell
    aspellDicts.en
    gitAndTools.gitFull
    ripgrep
    fzf
    less
    tree
    rofi
    rofi-pass
    pass
    stow
    nox
    maim
    xclip
    xdg_utils
    gvfs
  ];
}
