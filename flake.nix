{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, utils, nixpkgs, ... }:
    utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        packages.default = pkgs.stdenv.mkDerivation
          {
            name = "miku-cursor-linux";
            src = ./.;
            installPhase = ''
              mkdir -p $out/share/icons/
              mv miku-cursor-linux $out/share/icons/
            '';
          };
      });
}
