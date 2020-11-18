{ config, pkgs, ... }: {
  home.packages = [ pkgs.cacert ];
  programs.git = {
    enable = true;
    lfs.enable = true;
    userEmail = "kennan@case.edu";
    userName = "Kennan LeJeune";
    signing = {
      key = "kennan@case.edu";
      signByDefault = true;
    };
  };
}
