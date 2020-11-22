# UNIX Dotfile Configuration with Nix

[![Build Status](https://travis-ci.com/kclejeune/system.svg?branch=server-config)](https://travis-ci.com/kclejeune/system)

## Installing Nix Package Manager

Run the following to perform a multi-user installation for darwin or standard linux. On macOS, use the additional flag `--darwin-use-unencrypted-nix-store-volume`.

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
