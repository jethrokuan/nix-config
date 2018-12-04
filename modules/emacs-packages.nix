{ pkgs, ... }:

let
myPackages = (epkgs: (
  with epkgs.melpaPackages; [
    epkgs.emacs-libvterm
    adoc-mode
    aggressive-indent
    alchemist
    autodisass-java-bytecode
    avy
    beacon
    bury-successful-compilation
    clj-refactor
    color-identifiers-mode
    company-anaconda
    company-auctex
    company-go
    company-lsp
    company-quickhelp
    company-tern
    counsel
    counsel-projectile
    crux
    deft
    diff-hl
    diminish
    dired-narrow
    dired-ranger
    dired-subtree
    direnv
    docker
    dockerfile-mode
    dtrt-indent
    easy-kill
    elfeed
    elfeed-org
    elixir-mode
    emmet-mode
    ensime
    esh-autosuggest
    esup
    eww-lnum
    expand-region
    eyebrowse
    fish-mode
    flx
    flycheck-clojure
    flycheck-color-mode-line
    flycheck-pos-tip
    flyspell-correct
    flyspell-correct-ivy
    gist
    git-link
    go-dlv
    go-mode
    golint
    google-c-style
    gorepl-mode
    gradle-mode
    groovy-mode
    haskell-mode
    highlight-indent-guides
    hl-todo
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
    lsp-java
    lsp-javascript-typescript
    lsp-mode
    lsp-python
    lsp-ui
    magit
    markdown-mode
    meghanada
    minions
    moody
    nix-mode
    no-littering
    notmuch
    olivetti
    org-bullets
    org-cliplink
    org-download
    org-gcal
    org-journal
    org-pomodoro
    org-ref
    ox-ioslide
    paradox
    pdf-tools
    peep-dired
    prettier-js
    projectile
    py-isort
    pytest
    rainbow-delimiters
    rg
    rust-mode
    scss-mode
    shackle
    shm
    skewer-mode
    slime-company
    smart-jump
    smart-mode-line
    smartparens
    sphinx-doc
    swiper
    sx
    tao-theme
    tide
    tuareg
    typescript-mode
    use-package
    visual-regexp
    volatile-highlights
    web-mode
    wgrep
    which-key
    writegood-mode
    ws-butler
    yaml-mode
    yapfify
  ] ++
  [
    epkgs.orgPackages.org-plus-contrib
    epkgs.rainbow-mode
  ]));
in
{
  myPackages = myPackages;
}
