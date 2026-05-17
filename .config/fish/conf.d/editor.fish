# Editor
set -gx EDITOR 'zed --wait'
set -gx NVIMHOME "$XDG_CONFIG_HOME/nvim"

abbr --add t tmux-sessioniser
abbr --add n nvim \"+FzfLua files\"
