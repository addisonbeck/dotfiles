export PATH=~/bin/$(hostname):~/bin/$(uname -m):~/bin:~/.nvm:$PATH
export EDITOR=vim
export LANG=en_US.UTF-8
export NVM_DIR="$HOME/.nvm" 
[ -e .config/$(hostname).profile ] && . .config/$(hostname).profile
