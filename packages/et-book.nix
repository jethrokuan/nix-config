{stdenv, fetchzip}:

fetchzip {
  name = "et-book-fonts";
  url = "https://github.com/jethrokuan/et-book/archive/gh-pages.zip";

  postFetch = ''
    mkdir -p $out/share/fonts
    unzip -j $downloadedFile \*.ttf -d $out/share/fonts/et-book
  '';

  sha256 = "13gn5f7czza1k75j67ydvnwy2p2izfn3lxzvrfdxpgd5m04l4a7h";

  meta = with stdenv.lib; {
    description = "Font for ET Book";
    license = licenses.free;
    platforms = platforms.all;
  };
}
