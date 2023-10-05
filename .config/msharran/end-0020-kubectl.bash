alias kctx="kubectx"
alias kns="kubens"
alias k='kubectl'

# kubectl-krew
export PATH="${PATH}:${HOME}/.krew/bin"

# k8s prompt. Refer: https://github.com/superbrothers/zsh-kubectl-prompt
autoload -U colors; colors
source ~/.oh-my-zsh/plugins/zsh-kubectl-prompt/kubectl.zsh
RPROMPT='%{$fg[green]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
