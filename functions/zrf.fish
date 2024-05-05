function zrf --description "run in new floating pane"
  command zellij run --name "$argv" --floating -- fish -c "$argv"
end
