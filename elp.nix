{ stdenv, system, fetchzip }:

let
  version = "2024-05-24";
  # version = "2024-06-07";
  otp_version = "26.2";
in
stdenv.mkDerivation {
  name = "elp";

  src = 
    # I only care about aarch64-darwin and x86_64-linux
    if system == "aarch64-darwin"
    then
        fetchzip {
          url = "https://github.com/WhatsApp/erlang-language-platform/releases/download/${version}/elp-macos-aarch64-apple-darwin-otp-${otp_version}.tar.gz";
          hash = "sha256-6Cl9fLf5lzATR/QvOuggaq/HxNjdauZcs5jtBbgvMbM=";
          # hash = "sha256-/6V0+18oRjhl6UE7j4jRVO+DFksvGYmFW5PlfDNatwI=";
        }
      else 
        fetchzip {
          url = "https://github.com/WhatsApp/erlang-language-platform/releases/download/${version}/elp-linux-x86_64-unknown-linux-gnu-otp-${otp_version}.tar.gz";
          hash = "sha256-0000000000000000000000000000000000000000000=";
        };

  installPhase = ''
    mkdir -p $out/bin
    cp $src/elp $out/bin
  '';
}
