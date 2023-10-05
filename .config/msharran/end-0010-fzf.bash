# FZF configuration

# exit with error if fd is not installed
# show the installation link for fd
if ! command -v fd &> /dev/null; then
    echo "fd is not installed. Please install fd first."
    echo "Installation link: https://github.com/sharkdp/fd"
    exit 1
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden'
# export FZF_DEFAULT_OPTS="--border --height 60% --layout=reverse"
