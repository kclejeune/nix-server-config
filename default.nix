{ pkgs ? import <nixpkgs> { } }:
let
  isDarwin = pkgs.stdenvNoCC.isDarwin;
  configuration = "$HOME/.nixpkgs/home.nix";

  homeManagerBuild = ''
    set -e
    ${pkgs.nixFlakes}/bin/nix --experimental-features 'flakes nix-command' build .#homeManagerConfigurations.darwin.activationPackage
  '';

  build = pkgs.writeShellScriptBin "build" ''
    ${homeManagerBuild}
  '';

  rebuild = pkgs.writeShellScriptBin "rebuild" ''
    ${homeManagerBuild}
    ./result/activate
  '';

in pkgs.mkShell {
  buildInputs = [
    # keep this line if you use bash
    pkgs.bashInteractive
    rebuild
    build
  ];
}

