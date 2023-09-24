# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
alias k='kubectl'
alias awsid='aws sts get-caller-identity'

alias flushdns='sudo killall -HUP mDNSResponder'
alias kctx="kubectx"
alias kns="kubens"
alias t="tmux"
alias tnew="tmux new -s"
alias tattach="tmux attach -t"


# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export GO111MODULE=on

export PATH=$PATH:$HOME/usr/local/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.npm-global/bin
export NOTES="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes"

### FUNCTIONS

sshaddkeys() {
  ssh-add ~/.ssh/id_rsa
  ssh-add ~/.ssh/id_rsa_happay
  cd ~/.ssh/ssh-keys
  ssh-add -v --apple-use-keychain $(ls | grep -v .pub)
}

which_aws_account() {
  cat ~/.aws/config | grep -B1 $1
}

notes() {
  cd $NOTES
}

ssh_centralsre() {
  ssh -i ~/.ssh/ssh-keys/central-sre.pem $1
}

path() {
  echo $PATH | tr ":" "\n"
}

awsunset() {
  unset $(env |grep AWS_|cut -d= -f1)
}

awsprofile() {
  aws-okta-py save-creds -f -p $1
  export AWS_PROFILE=$1
}

awsweb() {
  aws-okta-py login $@
}

assume_role() {
    echo "Assuming role $1"
    export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
        $(aws sts assume-role \
            --role-arn $1 \
            --role-session-name MySessionName \
            --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
    --output text))
}


kp() {
    echo "killing port with command...\nfuser -k $1/tcp"
    fuser -k $1/tcp
}



# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="fishy" # set by `omz`

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git kubectl zsh-autosuggestions zsh-kubectl-prompt)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH=$PATH:$HOME/bin


complete -C '/usr/local/bin/aws_completer' awslocal

# kubectl-krew
export PATH="${PATH}:${HOME}/.krew/bin"

# k8s prompt. Refer: https://github.com/superbrothers/zsh-kubectl-prompt
autoload -U colors; colors
source ~/.oh-my-zsh/plugins/zsh-kubectl-prompt/kubectl.zsh
RPROMPT='%{$fg[green]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# Starship shell
eval "$(starship init zsh)"

### UBUNTU CLI CONFIGURATION

ubuntu() {
  if [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
    printf "%s\n"     "Command Usage:"     "  ubuntu start"     "  ubuntu stop"     "  ubuntu exec bash"     "  ubuntu exec ls -l"
  else
    UBUNTU_DIR=$HOME/play/labs/linux/ubuntu
    if [[ -d $UBUNTU_DIR ]]; then
      cd $UBUNTU_DIR
      ./$1.sh ${@:2}
    else
      echo "directory not found. clone github.com/msharran/labs into $HOME/play and try again"
    fi
  fi
}


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

autoload -U compinit; compinit

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Created by `pipx` on 2023-04-26 05:39:26
export PATH="$PATH:/Users/sharranm/.local/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

alias vim='nvim'
export EDITOR='nvim'

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
export FZF_DEFAULT_OPTS="--border"

vf() {
    select=$(fzf)
    if [[ -n $select ]]; then
        vim $select
    fi
}
