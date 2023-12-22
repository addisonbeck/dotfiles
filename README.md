# My dotfiles

> Based on [this simple concept](https://drewdevault.com/2019/12/30/dotfiles.html) from Drew DeVault

![terminal](./screenshots/terminal.png)

![neovim](./screenshots/neovim.png)

## Overview

I try and build as much remotely as I can. The scripts here can configure OSX clients to do some tasks, Ubuntu servers to do others, and Arch to do a bit of both. The tools I use the most are:

1. [Bitwarden](https://bitwarden.com) for managing secrets
1. [Yubikeys](https://www.yubico.com) for identifying myself
1. [Alacritty](https://github.com/alacritty/alacritty) as a terminal emulator
1. [Fish](https://github.com/fish-shell/fish-shell) as a shell
1. [Tmux](https://github.com/tmux/tmux) as a terminal multiplexer
1. [Starship](https://github.com/starship/starship) as a prompt
1. [Neovim](https://github.com/neovim/neovim) as an editor
1. [Yabai](https://github.com/koekeishiya/yabai) as a tiling window manager for OSX
1. [Sketchybar](https://github.com/FelixKratz/SketchyBar) as a status bar on OSX

## Installing

This config isn't meant to be usable by anyone else, but you might enjoy poking around the scripts.

If you're me (or really just want to try) there are scripts for provisioning in the repo.

To build a user and install from root on a fresh machine on ubuntu:

```bash
curl -s https://raw.githubusercontent.com/addisonbeck/dotfiles/main/bin/provision-machine \
--output main.sh && \
bash main.sh
```

To build a user and install from root on a fresh machine on arch:

```bash
curl -s https://raw.githubusercontent.com/addisonbeck/dotfiles/main/bin/provision-arch \
--output main.sh && \
bash main.sh
```

To install on an existing machine:

```bash
curl -s https://raw.githubusercontent.com/addisonbeck/dotfiles/main/bin/clone-self \
--output main.sh && \
bash main.sh
```
