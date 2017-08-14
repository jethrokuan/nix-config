{ config, pkgs, ... }:

let
  myEmacs = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;
  emacs = emacsWithPackages (epkgs: (with epkgs.melpaPackages; [
        aggressive-indent
    avy
    bury-successful-compilation
    clj-refactor
    company-anaconda
    company-auctex
    company-nixos-options
    company-tern
    counsel-projectile
    company-quickhelp
    crux    
    deft
    diff-hl
    dired-k
    dired-narrow
    dired-ranger
    direnv
    dumb-jump
    easy-kill
    elfeed
    emmet-mode
    eshell-git-prompt
    esup
    eww-lnum
    expand-region
    eyebrowse
    fancy-narrow
    fish-mode
    flx
    flycheck-clojure
    flycheck-color-mode-line
    flycheck-pos-tip
    go-mode
    golden-ratio
    guru-mode
    highlight-indent-guides
    ibuffer-projectile
    iedit
    indium
    isend-mode
    js-doc
    js2-refactor
    json-mode
    keyfreq
    magit
    markdown-mode
    move-text
    nix-mode
    no-littering
    paradox
    peep-dired
    projectile
    py-isort    pytest
    rainbow-delimiters
    # rainbow-mode
    rg
    rjsx-mode
    rust-mode
    scss-mode
    shackle
    skewer-mode
    slime-company
    smartparens
    sos
    sphinx-doc    
    use-package
    visual-regexp
    volatile-highlights
    vue-mode
    web-mode
    wgrep
    which-key
    yapfify
    zenburn-theme
  ] ++
  [
    epkgs.org-plus-contrib
    epkgs.darkroom
  ]));
in
{
  environment.systemPackages = [
    emacs
  ];

  services.emacs.package = emacs;
  services.emacs.enable = true;
}
