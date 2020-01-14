{ pkgs ? import <nixpkgs> {} }:

with pkgs;
rustPlatform.buildRustPackage rec {
  name = "fluminurs-${version}";
  version = "1.1.3";

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
    rev = "e7313c3ef57e955c0181e1d2323343154af7e0c7";
    sha256 = "1fax923f2ygs3vdjggw6fw1f7vwk4a9lf30v49pqj9111j6fpjjb";
  };

  cargoSha256 = "1296zw7r6m1gz5cgk33qrdrdnnw1xsfv75chnmya0i24chr9cvby";

  meta = with stdenv.lib; {
    description = "Luminus api";
    homepage = https://github.com/indocomsoft/fluminurs;
    license = licenses.mit;
    platforms = platforms.all;
  };
}
