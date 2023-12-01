PS1='$(prompt) \$ '

export PATH=~/bin/$(hostname):~/bin/$(uname -m):~/bin:$PATH
export EDITOR=vim
export LANG=en_US.UTF-8
[ -e .config/$(hostname).profile ] && . .config/$(hostname).profile
