{ stdenvNoCC, unzip } :

stdenvNoCC.mkDerivation {
  pname = "myriadpro";
  version = "1.0.0";
  src = ./sources/myriad.zip;
  passthru.tlType = "run";
  phases = [ "unpackPhase" "installPhase" ];
  buildInputs = [ unzip ];
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/fonts/opentype/adobe/
    cp -R *.otf $out/share/fonts/opentype/adobe/
    runHook postInstall
  '';
}
