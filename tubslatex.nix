{ stdenv, fetchurl, unzip }:

stdenv.mkDerivation rec {
  pname = "tubslatex";
  version = "1.3.4";
  name = "${pname}-${version}";
  tlType = "run";
  
  src = ./sources/tubslatex_1.3.4.tds.zip;

  buildInputs = [ unzip ];

  # Multiple files problem
  unpackPhase = ''
    mkdir tubslatex 
    cd tubslatex
    unzip $src
  '';

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -pr doc fonts tex $out
    runHook postInstall
  '';
}
