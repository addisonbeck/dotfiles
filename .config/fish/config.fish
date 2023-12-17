if status is-interactive
  if test -e ~/.profile
      fenv "source ~/.profile"
  end
  alias fd="fd -uu"
  alias bw-p="set -g -x BITWARDENCLI_APPDATA_DIR '~/.config/bw-p' && $(which bw) $argv"
  alias bw-w="set -g -x BITWARDENCLI_APPDATA_DIR '~/.config/bw-w' && $(which bw) $argv"
  omf theme ''
  if test -e ~/.config/starship-installed
    starship init fish | source
  end
end
