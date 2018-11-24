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
    gnumake
    gvfs
    less
    maim
    nox
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
    aria2
  ];

  services.aria2.enable = true;
}
