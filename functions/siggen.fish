function siggen --wraps='cd ~/projects/siggen/' --argument-names workspace directory --description 'alias siggen cd ~/projects/siggen'
  cd ~/projects/siggen
  if test -n "$workspace"
    cd $workspace
  end
  if test -n "$directory"
    switch "$directory"
      case bin
        cd SigGen-cpp/build/bin
      case cpp
        cd SigGen-cpp
      case ui
        cd SigGen-ui
    end
  end
end
