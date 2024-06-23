{pkgs, elp, helix-pkg, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    # nix tools
    alejandra

    # erlang stuff
    erlang_26
    rebar3
    elp
    helix-pkg

    # postgresql tools
    dbmate
  ];
}
