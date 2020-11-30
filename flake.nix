{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-20.09";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:rycee/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in { devShell = import ./shell.nix { inherit pkgs; }; })
    // (let user = "${builtins.getEnv "USER"}";
    in {
      # activate with
      # nix --experimental-features 'flakes nix-command' build .#homeManagerConfigurations.darwin.activationPackage
      homeManagerConfigurations = {
        darwin = inputs.home-manager.lib.homeManagerConfiguration {
          configuration = ./home.nix;
          system = "x86_64-darwin";
          username = "${user}";
          homeDirectory = "/Users/${user}";
        };

        linux = inputs.home-manager.lib.homeManagerConfiguration {
          configuration = ./home.nix;
          system = "x86_64-linux";
          username = "${user}";
          homeDirectory = "/home/${user}";
        };
      };
    });
}
