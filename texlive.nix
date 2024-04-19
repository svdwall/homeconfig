{ stdenvNoCC, unzip, callPackage, texlive, tubslatex, myriadpro } :
let 
  postCombineOverride = oldAttrs: {
    postBuild = oldAttrs.postBuild + ''
      updmap --sys --enable Map=NexusProSans.map --enable Map=NexusProSerif.map
      updmap --sys
    '';
  };
  texfonts.pkgs = [ myriadpro ];
  tubslatexwrapper.pkgs = [ tubslatex ];
in
  (texlive.combine {
    inherit (texlive) scheme-full;
    inherit tubslatexwrapper;
    inherit texfonts;
  }).overrideAttrs postCombineOverride


