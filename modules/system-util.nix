{config, pkgs, ...}:

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
    ntfs3g
    pass
    ripgrep
    rofi
    rofi-pass
    stow
    tree
    wget
    xclip
    xdg_utils
  ];
}
