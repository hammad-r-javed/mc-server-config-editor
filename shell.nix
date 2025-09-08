let
  pkgs_main = import (fetchTarball {
    url = "https://releases.nixos.org/nixpkgs/nixpkgs-25.11pre856744.ca7729638096/nixexprs.tar.xz";
    sha256 = "1g1zv36fs0sd7jk3z1b5yn4nrd578f1iy32a001za13mmllr0jrw";
  }) { };
in
pkgs_main.mkShell {
  buildInputs = [
    pkgs_main.elmPackages.elm
    pkgs_main.python313Packages.pystray
    pkgs_main.python313Packages.flask
  ];
}
