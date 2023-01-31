{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "displayfile";

  src = fetchurl {
      url = "https://gist.githubusercontent.com/Liam0205/9a7f926845164b5392f40f1a3911f6fd/raw/90f01234da88e9d9051f549684a4dd189959f7c6/displayfile";
      sha256 = "+ZeGVbyM75Uq79Ye4Hyg3sB8Y7ClGC3RVmA5ShPwJPo=";
  };

  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin 
    cp $src $out/bin/displayfile
    chmod +x $out/bin/displayfile
  '';
}

