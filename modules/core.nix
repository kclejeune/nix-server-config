{ config, pkgs, ... }:
let sources = import ../nix/sources.nix;
in {
  imports = [ ./vim ./zsh ./kitty ];

  xdg.enable = true;

  # install extra common packages
  home.packages = with pkgs; [
    fd
    ripgrep
    htop
    curl
    wget
    mosh
    openssh
    neofetch
    gawk
    coreutils-full
  ];

  programs = {
    home-manager = {
      enable = true;
      path = "${sources.home-manager}";
    };
    direnv = {
      enable = true;
      enableNixDirenvIntegration = true;
    };
    fzf = {
      enable = true;
      defaultOptions = [ "--height 40%" "--border" ];
      changeDirWidgetCommand = "fd --type d";
      changeDirWidgetOptions = [ "--preview 'tree -C {} | head -200'" ];
      fileWidgetCommand = "fd --type f";
      fileWidgetOptions = [ "--preview 'bat --color=always --plain {}'" ];
    };
    bat = {
      enable = true;
      config = { theme = "TwoDark"; };
    };
    htop.enable = true;
    gpg.enable = true;
  };

}
