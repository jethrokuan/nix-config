{ pkgs, ... }:

let
  myPackages = (epkgs: (with epkgs.melpaPackages; [
    aggressive-indent
    # all-the-icons-dired
    alchemist
    autodisass-java-bytecode
    avy
    bury-successful-compilation
    challenger-deep-theme
    clj-refactor
    company-anaconda
    company-auctex
    company-tern
    counsel-projectile
    company-quickhelp
    crux
    deft
    diff-hl
    diminish
    dired-k
    dired-narrow
    dired-ranger
    dired-subtree
    direnv
    docker
    dockerfile-mode
    dumb-jump
    easy-kill
    ein
    elfeed
    elfeed-org
    elixir-mode
    emmet-mode
    emojify
    ensime
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
    gradle-mode
    go-mode
    golden-ratio
    google-c-style
    haskell-mode
    highlight-indent-guides
    htmlize
    ibuffer-projectile
    iedit
    indium
    interleave
    intero
    isend-mode
    ivy-bibtex
    js-doc
    js2-refactor
    json-mode
    key-chord
    keyfreq
    magit
    # magithub
    markdown-mode
    meghanada
    move-text
    nix-mode
    nix-sandbox
    no-littering
    notmuch
    olivetti
    org-ref
    org-download
    org-pomodoro
    ox-ioslide
    paradox
    pdf-tools
    peep-dired
    projectile
    py-isort
    pytest
    rainbow-delimiters
    # rainbow-mode
    rg
    rjsx-mode
    rust-mode
    scss-mode
    shackle
    shm
    skewer-mode
    slime-company
    smart-mode-line
    smartparens
    sos
    sphinx-doc
    tide
    typescript-mode
    use-package
    visual-regexp
    volatile-highlights
    vue-mode
    web-mode
    wgrep
    ws-butler
    which-key
    yaml-mode
    yapfify
    zenburn-theme
  ] ++
  [
    epkgs.orgPackages.org-plus-contrib
    epkgs.rainbow-mode
  ]));
in
{
  myPackages = myPackages;
}
