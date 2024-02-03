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
export FZF_DEFAULT_OPTS="--border
    --color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
