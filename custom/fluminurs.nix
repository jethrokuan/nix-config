{ pkgs, ... }:

with pkgs;
rustPlatform.buildRustPackage rec {
  name = "fluminurs-${version}";
  version = "0.1.6";

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
    rev = "8b22c761de0f762ce430fb67e7a227c2f0f3fe62";
    sha256 = "1alvrvbqnyqdb2nlfw5752dgzfiwsh0cj53q9pb3sfagvscdsbzv";
    # date = 2019-03-07T10:57:44+08:00;
  };

  cargoSha256 = "0hacw8kdfyf3qpz0l6g01zsh0gsr6ysy5228z3i367svsqfzjsv7";

  meta = with stdenv.lib; {
    description = "Luminus api";
    homepage = https://github.com/indocomsoft/fluminurs;
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
