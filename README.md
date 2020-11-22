# MacOS System Configuration with Nix

[![Build Status](https://travis-ci.com/kclejeune/dotfiles.svg?branch=master)](https://travis-ci.com/kclejeune/dotfiles)

## Installing Nix Package Manager

Run the following to perform a multi-user installation for darwin or standard linux. This step is skipped on NixOS.

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

## Cloning Dotfiles

Clone this repository into `~/.nixpkgs` with

```
git clone https://github.com/kclejeune/system -b server-config ~/.nixpkgs
```

Use

```bash
nix-shell --run "rebuild"
```

to bootstrap home-manager on the system and install the first generation.

## Installing Homebrew dependencies

The few leftover homebrew packages and brew casks are stored in `~/Brewfile`. They can be installed using `cd ~ && brew bundle`.
