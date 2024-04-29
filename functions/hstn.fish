function hstn --description "query Historian and insert into command line"
		set temp (curl -fsSL http://historian/commands/list | fzf)
		commandline $temp
end
