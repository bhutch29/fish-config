function z --argument-names session --description "zellij session creator"
  if test -z "$session"
    command zellij --layout welcome
    return
  end

  command zellij -l $session -s $session
end
