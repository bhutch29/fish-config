function gs --description "Opens a Magit buffer at the current directory"
    set wd (pwd); nvim -c "Git" -c "only" .
end
