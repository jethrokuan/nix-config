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
    rev = "de6b9db1fdc155f591ec41102c00e26dc0ba083a";
    sha256 = "1rghxslpmyv1i03ayzkxrn4sfz5721k57hc7mgw6r2mkf70qycmp";
    # date = 2019-02-20T18:11:42+08:00;
  };

  cargoSha256 = "0v8l2ansszg8q34yg76lnlf1rkcw329d5da5gjsb411yd666c0b2";

  meta = with stdenv.lib; {
    description = "Luminus api";
    homepage = https://github.com/indocomsoft/fluminurs;
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
