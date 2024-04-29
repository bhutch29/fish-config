# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

abbr -a -- ap ansible-playbook
abbr -a -- xclipc xclip -selection clipboard
abbr -a -- gw git worktree

complete -c siggen -a "(ls ~/projects/siggen/)"

for mode in default insert
    bind --mode $mode \ca list_of_lists
    bind --mode $mode \ch hstn
end

set fish_greeting
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -g theme_color_scheme zenburn
set -g theme_date_format "+%T"
set -g theme_nerd_fonts yes
set -U FZF_LEGACY_KEYBINDINGS 0
set -gx VISUAL nvim
set -gx EDITOR nvim
set -gx PAGER less
set -g FZF_FIND_FILE_COMMAND "rg --hidden -l '' -g '!/.cache' -g '!/.local'"
set -g FZF_OPEN_COMMAND "rg --hidden -l '' -g '!/.cache' -g '!/.local'"
set -g FZF_CTRL_T_COMMAND "rg --hidden -l '' -g '!/.cache' -g '!/.local'"
set -x CONAN_REVISIONS_ENABLED 1
set -x PATH /home/bhutch/.local/bin $PATH
set -x PATH /usr/lib/ccache/bin/ $PATH
set -x PATH /home/bhutch/go/bin/ $PATH
set -x PATH /home/bhutch/.cargo/bin/ $PATH
set -x CHROME_BIN /usr/bin/chromium

# Set LS command colors
eval (dircolors -c $HOME/.dir_colors/dircolors )

# fix for delete key in vi insert mode
bind -M insert -k dc delete-char 2>/dev/null

fish_vi_key_bindings

# Comments added for rainbow-mode. Set mode to see colors
set -g fish_color_normal             FFFFEF #FFFFEF
set -g fish_color_command            FFFFEF #FFFFEF
set -g fish_color_quote              8FB28F #8FB28F
set -g fish_color_comment     8FB28F --bold #8FB28F
set -g fish_color_redirection        5C888B #5C888B
set -g fish_color_end                BFEBBF #BFEBBF
set -g fish_color_error       AC7373 --bold #AC7373
set -g fish_color_param              93E0E3 #93E0E3
set -g fish_color_autosuggestion     DC8CC3 #93E0E3
set -g fish_color_match              94BFF3 #94BFF3
set -g fish_color_selection          --background=2B2B2B #2B2B2B
set -g fish_color_search_match       --background=2B2B2B #2B2B2B
set -g fish_color_operator           F0DFAF #F0DFAF
set -g fish_color_escape             D0BF8F #D0BF8F
set -g fish_color_cancel      DFAF8F --bold #D0BF8F

# Foreground #656555 #989890 #DCDCCC #FFFFEF #FFFFFD
# Background #000000 #2B2B2B #303030 #383838 #3F3F3F #494949 #4F4F4F #5F5F5F #6F6F6F
# Red #6C3333 #7C4343 #8C5353 #9C6363 #AC7373 #BC8383 #CC9393 #DCA3A3 #ECB3B3
# Orange #DFAF8F
# Yellow #D0BF8F #E0CF9F #F0DFAF
# Green #2F4F2F #3F5F3F #4F6F4F #5F7F5F #6F8F6F #7F9F7F #8FB28F #9FC59F #AFD8AF #BFEBBF
# Cyan #93E0E3
# Blue #BDE0F3 #ACE0E3 #94BFF3 #8CD0D3 #7CB8BB #6CA0A3 #5C888B #4C7073 #366060
# Magenta #DC8CC3
