{ pkgs, ... }:

with pkgs;
rustPlatform.buildRustPackage rec {
  name = "fluminurs-${version}";
  version = "0.1.5";

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
    rev = "2cd9a0d03c08d41d4b5da049ac4af672f956c301";
    sha256 = "001l0h5jxkjgl6yc7qli23isgjbvpd1j40vwkbliwp5if4bmn1w4";
    # date = 2019-02-21T16:33:08+08:00;
  };

  cargoSha256 = "0v8l2ansszg8q34yg76lnlf1rkcw329d5da5gjsb411yd666c0b2";

  meta = with stdenv.lib; {
    description = "Luminus api";
    homepage = https://github.com/indocomsoft/fluminurs;
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
