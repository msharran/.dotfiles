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

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
