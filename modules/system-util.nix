{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
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
    scrot
    xclip
  ];
}
