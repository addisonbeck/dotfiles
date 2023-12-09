if status is-interactive
  if test -e ~/.env
      envsource ~/.env
  end
  alias fd="fd -uu"
end
