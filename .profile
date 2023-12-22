export PATH=~/bin/$(hostname):~/bin/$(uname -m):~/bin:~/.nvm:/usr/local/go/bin:~/.dotnet/tools:$PATH
export EDITOR=vim
export LANG=en_US.UTF-8
export NVM_DIR="$HOME/.nvm" 
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -e .config/$(hostname).profile ] && . .config/$(hostname).profile

if [ -f ~/.env ]; then
  source ~/.env
fi
