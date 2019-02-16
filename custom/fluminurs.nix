{ pkgs, ... }:

with pkgs;
rustPlatform.buildRustPackage rec {
  name = "fluminurs-${version}";
  version = "0.1.1";

  nativeBuildInputs = [
    rustc cargo
    pkgconfig
  ];

  buildInputs = [
    openssl
  ];

  src = fetchFromGitHub {
    owner = "indocomsoft";
    repo = "fluminurs";
    rev = "7876c38f34f45c08e55fda3f4c7b7c987d5a6261";
    sha256 = "1i3d81613ad4njwf5fscx8cq0j9rbf2imikdwaaf6gzf8nxgm3lr";
    # date = 2019-02-15T02:42:10+08:00;
  };

  cargoSha256 = "02bd26kpfcbqk1dk85f823228ki6nhvqjhwkkggg1vk4irg3za6b";

  meta = with stdenv.lib; {
    description = "Luminus api";
    homepage = https://github.com/indocomsoft/fluminurs;
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
