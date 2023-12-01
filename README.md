My dotfiles

> Based on [this simple concept](https://drewdevault.com/2019/12/30/dotfiles.html) from Drew DeVault

To build a user and install from root on a fresh machine:

```bash
curl -s https://raw.githubusercontent.com/addisonbeck/dotfiles/main/bin/provision-machine.sh \
--output main.sh && \
bash main.sh
```

To install on an existing machine:

```bash
cd ~ &&
git init &&
git remote add origin https://github.com/addisonbeck/dotfiles.git &&
git fetch &&
git checkout -f main
```
