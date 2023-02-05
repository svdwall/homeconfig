{
  packageOverrides = pkgs: rec {

    postCombineOverride = oldAttrs: {
      postBuild = oldAttrs.postBuild + ''
        updmap --sys --enable Map=NexusProSans.map --enable Map=NexusProSerif.map
        updmap --sys
      '';
    };
    
    tubslatex.pkgs = [(pkgs.callPackage (import ./tubslatex.nix) {})];  
    mytexlive = (pkgs.texlive.combine {                                                                                                                                                          
      inherit (pkgs.texlive) scheme-full;                                                                                                                                                                    
      inherit tubslatex;
    }).overrideAttrs postCombineOverride;
  };
}
