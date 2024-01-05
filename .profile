export PATH="~/bin/$(uname -m):~/bin:~/bin/cloners:~/bin/installers:~/bin/one-liners:~/bin/os-management:~/bin/secrets-management:~/bin/tmux-helpers:~/bin/binwarden:~/.nvm:/usr/local/go/bin:~/.dotnet/tools:/opt/local/bin:$PATH"

export EDITOR=vim
export LANG=en_US.UTF-8
export NVM_DIR="$HOME/.nvm" 
export COLORTERM=truecolor
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -e .config/$(hostname).profile ] && . .config/$(hostname).profile

if [ -f ~/.env ]; then
  source ~/.env
fi

