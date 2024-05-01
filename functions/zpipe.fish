function zpipe
  if count $argv > /dev/null
    command zellij pipe -p $argv
  else
    command zellij pipe
  end
end
