alias vim='nvim'

export EDITOR='nvim'

v() {
    if [[ -n $1 ]]; then
        vim $1
    else
        local select=$(fzf --preview 'bat --color=always -n {}')
        if [[ -n $select ]]; then
            vim $select
        fi
    fi
}
