{ pkgs ? import <nixpkgs> {} }:

with pkgs;
rustPlatform.buildRustPackage rec {
  name = "fluminurs-${version}";
  version = "0.2.0";

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
    rev = "fc8aca19699f86fc5d14ecabb7ba0af4c13f2da5";
    sha256 = "10wfjbznc2mfyb663bqxb6kay9qpspkjd2r57c4dfkmqmrmfviib";
    # date = 2019-08-27T07:53:38+08:00;
  };

  cargoSha256 = "0ngakh54kq8rikvxs5nfy5gw9hpawwdy6j9g6gvpkfcv55k4amr9";

  meta = with stdenv.lib; {
    description = "Luminus api";
    homepage = https://github.com/indocomsoft/fluminurs;
    license = licenses.mit;
    platforms = platforms.all;
  };
}
