{ sources ? import ./nix/sources.nix }:
let
  pkgs = import sources.nixpkgs { };
  hm = import sources.home-manager { };
  isDarwin = pkgs.stdenvNoCC.isDarwin;
  configuration = "$HOME/.nixpkgs/home.nix";

  rebuild = pkgs.writeShellScriptBin "rebuild" ''
    set -e
    export HOME_MANAGER_CONFIG=$HOME/.nixpkgs/home.nix
    ${hm.home-manager}/home-manager/home-manager switch -f $HOME/.nixpkgs/home.nix \
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
