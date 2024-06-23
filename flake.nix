{
  description = "Erlang bits";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    helix.url = "github:helix-editor/helix";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    helix,
    ...
  }:
    flake-utils.lib.eachSystem ["x86_64-linux" "x86_64-darwin" "aarch64-darwin"] (system: let
      erlang_26_rebar_overlay = final: prev: {
        rebar3 = prev.rebar3.overrideAttrs (oldAttrs: {
          buildInputs = [ final.erlang_26 ];
        });
      };

      pkgs = import nixpkgs {
        inherit system;
        config.allowBroken = true;
        overlays = [ erlang_26_rebar_overlay ];
      };
      elp = pkgs.callPackage ./elp.nix {};
      helix-pkg = helix.packages.${system}.default;

    in {
      devShell = import ./shell.nix {
        inherit pkgs;
        inherit elp;
        inherit helix-pkg;
      };
      # defaultPackage = erlang_bits;
      packages = flake-utils.lib.flattenTree {
        # inherit erlang_bits;
      };
    });
}
