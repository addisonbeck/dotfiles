if status is-interactive
  if test -e ~/.env
      envsource ~/.env
  end
  alias fd="fd -uu"
  omf theme ''
  if test -e ~/.config/starship-installed
    starship init fish | source
  end
end
