function zri --description "run in current pane"
  command zellij run --name "$argv" --in-place -- fish -c "$argv"
end
