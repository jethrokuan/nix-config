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
    rev = "df34b1e92f52ef796ee5eaab7ce6c80440e1aabe";
    sha256 = "1g9xg9cljbn8iprv3ab33xmzvjd1kz21kzwqy502npk6qdvav99f";
    # date = 2019-08-15T22:26:14-07:00;
  };

  cargoSha256 = "14vs59k7mm3krdzggkvijnqpyjs1p9f5g5aqgsgrsdqhp385yz6j";

  meta = with stdenv.lib; {
    description = "Luminus api";
    homepage = https://github.com/indocomsoft/fluminurs;
    license = licenses.mit;
    platforms = platforms.all;
  };
}
