if status is-interactive
  if test -e ~/.env
      envsource ~/.env
  end
  alias fd="fd -uu"
  alias tmux-h="tmux -f ~/.tmux.host.conf"
  alias tmux-c="tmux -f ~/.tmux.client.conf"
  omf theme ''
  if test -e ~/.config/starship-installed
    starship init fish | source
  end
end
