# UNIX Dotfile Configuration with Nix

![home-manager build](https://github.com/kclejeune/nix-server-config/workflows/home-manager%20build/badge.svg?branch=master)

## IMPORTANT:

This repository has been converted into a [Flake](https://nixos.wiki/wiki/Flakes) and 
moved back to my primary [system configuration repo](https://github.com/kclejeune/system). 
Everything here is still functional as a normal nix setup for non-nixOS machines using 
[niv](https://github.com/nmattia/niv) for dependency management. 
The project is still forkable but will no longer be updated.

## Installing Nix Package Manager

Run the following to perform a multi-user installation for darwin or standard linux. On macOS, use the additional flag `--darwin-use-unencrypted-nix-store-volume`.

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

## Cloning Dotfiles

Clone this repository into `~/.nixpkgs` with

```
git clone https://github.com/kclejeune/nix-server-config ~/.nixpkgs
```

Use

```bash
nix-shell --run "rebuild"
```

to bootstrap home-manager on the system and install the first generation.

## Installing Homebrew dependencies

The few leftover homebrew packages and brew casks are stored in `~/Brewfile`. They can be installed using `cd ~ && brew bundle`.
