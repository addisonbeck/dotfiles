# My dotfiles

> Based on [this simple concept](https://drewdevault.com/2019/12/30/dotfiles.html) from Drew DeVault

![terminal](./screenshots/terminal.png)

![neovim](./screenshots/neovim.png)

## Overview

I try and build as much remotely as I can. The scripts here can configure OSX clients to do some tasks and Ubuntu servers to do others. The tools I use the most are:

1. Bitwarden for managing secrets
1. Yubikeys for identifying myself
1. Alacritty as a terminal emulator
1. Fish as a shell
1. Tmux as a terminal multiplexer
1. Starship as a prompt
1. Neovim as an editor
1. Yabai as a tiling window manager for OSX
1. Sketchybar as a status bar on OSX

## Installing

This config isn't meant to be usable by anyone else, but you might enjoy poking around the scripts.

If you're me (or really just want to try) there are scripts for provisioning in the repo.

To build a user and install from root on a fresh machine:

```bash
curl -s https://raw.githubusercontent.com/addisonbeck/dotfiles/main/bin/provision-machine \
--output main.sh && \
bash main.sh
```

To install on an existing machine:

```bash
curl -s https://raw.githubusercontent.com/addisonbeck/dotfiles/main/bin/clone-self \
--output main.sh && \
bash main.sh
```
