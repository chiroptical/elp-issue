{pkgs, elp, helix, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    # nix tools
    alejandra

    # erlang stuff
    erlang_26
    rebar3
    elp
    helix

    # postgresql tools
    dbmate
  ];
}
