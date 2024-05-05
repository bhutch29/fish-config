function zr --description "run in new pane"
  command zellij run --name "$argv" -- fish -c "$argv"
end
