{ sources ? import ./nix/sources.nix }:
let
  pkgs = import sources.nixpkgs { };
  hm = import sources.home-manager { };
  isDarwin = pkgs.stdenvNoCC.isDarwin;
  configuration = "$HOME/.nixpkgs/home.nix";

  rebuild = pkgs.writeShellScriptBin "rebuild" ''
    set -e
    export HOME_MANAGER_CONFIG=$HOME/.nixpkgs/home.nix
    ${hm.home-manager}/bin/home-manager switch --show-trace -f $HOME_MANAGER_CONFIG \
      -I nixpkgs=${sources.nixpkgs} \
      -I home-manager=${sources.home-manager} \
  '';

in pkgs.mkShell {
  buildInputs = [
    # keep this line if you use bash
    pkgs.bashInteractive
    rebuild
  ];
}
