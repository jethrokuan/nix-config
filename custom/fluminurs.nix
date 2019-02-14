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
    rev = "bf56aebdfee84521957440035866b6ad51d1bee7";
    sha256 = "1cjkgl5lr4r20v3cvk407i31hqnq2v9qk7jbf7lavim4zljsgnz1";
    # date = 2019-02-15T01:34:54+08:00;
  };

  cargoSha256 = "02bd26kpfcbqk1dk85f823228ki6nhvqjhwkkggg1vk4irg3za6b";

  meta = with stdenv.lib; {
    description = "Luminus api";
    homepage = https://github.com/indocomsoft/fluminurs;
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
