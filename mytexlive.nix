{ stdenvNoCC, unzip, callPackage, texlive } :
let 
  postCombineOverride = oldAttrs: {
    postBuild = oldAttrs.postBuild + ''
      updmap --sys --enable Map=NexusProSans.map --enable Map=NexusProSerif.map
      updmap --sys
    '';
  };
  myriadpro = callPackage (import ./myriadpro.nix) {};
  tubslatex.pkgs = [(callPackage (import ./tubslatex.nix) {})];  
  texfonts.pkgs = [ myriadpro ];
in 
  (texlive.combine {                                                                                                                                                          
    inherit (texlive) scheme-full;
    inherit tubslatex;
    inherit texfonts;
  }).overrideAttrs postCombineOverride


