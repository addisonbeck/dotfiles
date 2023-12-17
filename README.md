My dotfiles

> Based on [this simple concept](https://drewdevault.com/2019/12/30/dotfiles.html) from Drew DeVault

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
