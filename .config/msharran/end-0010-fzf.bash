# FZF configuration

# exit with error if fd is not installed
# show the installation link for fd
if ! command -v fd &> /dev/null; then
    echo "fd is not installed. Please install fd first."
    echo "Installation link: https://github.com/sharkdp/fd"
    exit 1
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude=.git'
export FZF_DEFAULT_OPTS="--border"

# Gruvbox dark colors
local color00='#32302f'
local color01='#3c3836'
local color02='#504945'
local color03='#665c54'
local color04='#bdae93'
local color05='#d5c4a1'
local color06='#ebdbb2'
local color07='#fbf1c7'
local color08='#fb4934'
local color09='#fe8019'
local color0A='#fabd2f'
local color0B='#b8bb26'
local color0C='#8ec07c'
local color0D='#83a598'
local color0E='#d3869b'
local color0F='#d65d0e'

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

# gruvbox light-medium colors
# local color00='#fbf1c7'
# local color01='#ebdbb2'
# local color02='#d5c4a1'
# local color03='#bdae93'
# local color04='#665c54'
# local color05='#504945'
# local color06='#3c3836'
# local color07='#282828'
# local color08='#9d0006'
# local color09='#af3a03'
# local color0A='#b57614'
# local color0B='#79740e'
# local color0C='#427b58'
# local color0D='#076678'
# local color0E='#8f3f71'
# local color0F='#d65d0e'
#
# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
# " --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
# " --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
# " --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"
