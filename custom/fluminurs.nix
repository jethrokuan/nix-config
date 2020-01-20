{ pkgs ? import <nixpkgs> {} }:

with pkgs;
rustPlatform.buildRustPackage rec {
  name = "fluminurs-${version}";
  version = "1.1.4";

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
    rev = version;
    sha256 = "1m3r6pmz95syw33avpkkvnd3wxl72jzb14cr9r573v0jbya0bgv7";
  };

  cargoSha256 = "0nrh9n3vpc7dji4bbslhyyqlj458dljhmhb0w3j4kcng1gg1723z";

  meta = with stdenv.lib; {
    description = "Luminus api";
    homepage = https://github.com/indocomsoft/fluminurs;
    license = licenses.mit;
    platforms = platforms.all;
  };
}
