{ pkgs, ... }:

with pkgs;
rustPlatform.buildRustPackage rec {
  name = "fluminurs-${version}";
  version = "0.1.0";

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
    rev = "046c4549393c1a57a95a5c36299d687c88898c7a";
    sha256 = "1kj5c96v2dnxy11an9xl6i820g6vhnp6a179k1vymcpnkzl6hvw2";
    # date = 2019-02-15T02:20:39+08:00;
  };

  cargoSha256 = "02bd26kpfcbqk1dk85f823228ki6nhvqjhwkkggg1vk4irg3za6b";

  meta = with stdenv.lib; {
    description = "Luminus api";
    homepage = https://github.com/indocomsoft/fluminurs;
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
