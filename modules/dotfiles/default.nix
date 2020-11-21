{ config, pkgs, ... }: {
  home.file = {
    keras = {
      source = ./keras;
      target = ".keras";
      recursive = true;
    };
  };

  xdg.configFile = {
    nixpkgs = {
      source = ./../..;
      recursive = true;
    };
  };
}
