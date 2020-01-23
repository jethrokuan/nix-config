{ pkgs ? import <nixpkgs> {} }:

with pkgs;
rustPlatform.buildRustPackage rec {
  name = "fluminurs-${version}";
  version = "ebfbbbcb3a5ea2fc1ebb5563d2861558084eec36";

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
    sha256 = "1xbpbwfvj0hxdhi195j9anyv1rji9g0aczsjg7h52rvl8ddvvkq2";
  };

  cargoSha256 = "111fsh0vk9ibl9m4cpm2zsp259r7xzakr1898vj5rji0b2jd6kxa";

  meta = with stdenv.lib; {
    description = "Luminus api";
    homepage = https://github.com/indocomsoft/fluminurs;
    license = licenses.mit;
    platforms = platforms.all;
  };
}
