set -gx PATH $PATH $HOME/bin
set -gx PATH $PATH /opt/homebrew/bin 
set -gx PATH $PATH $HOME/.local/bin 

# Go
set -gx GOPATH $HOME/go
set -gx PATH $PATH $GOROOT/bin
set -gx PATH $PATH $GOPATH/bin
set -gx GO111MODULE on
set -gx CGO_ENABLED 0

# Node
set -gx PATH $PATH $HOME/.npm-global/bin

# Ruby
set -gx PATH $PATH $HOME/.rvm/bin

# Java
# set -gx PATH $PATH $(/usr/libexec/java_home -v 11)

# Python
pyenv init - | source

# Deno 
set -gx PATH $PATH /Users/sharranm/.deno
set -gx PATH $PATH $DENO_INSTALL/bin

# Linkerd
set -gx PATH $PATH /Users/sharranm/.linkerd2/bin

# k8s
set -gx PATH $PATH $HOME/.krew/bin

# Rust
set -gx PATH $PATH $HOME/.cargo/bin

# C
# Add homebrew C headers and libs to compiler paths (for both gcc and clang)
# set -gx CPATH $(brew --prefix)/include $CPATH
# set -gx LIBRARY_PATH $(brew --prefix)/lib $LIBRARY_PATH

# Brew luarocks
# export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"
# set -gx DYLD_LIBRARY_PATH "$(brew --prefix)/lib" $DYLD_LIBRARY_PATH

# XDG_CONFIG_HOME
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

# Editor
set -gx EDITOR 'nvim'
set -gx NVIMHOME "$XDG_CONFIG_HOME/nvim"

# FZF
# --height 40% --layout reverse --border
set -gx FZF_DEFAULT_OPTS "--height 40% --layout reverse --border"

# Brew luarocks
# set -gx DYLD_LIBRARY_PATH "$(brew --prefix)/lib" $DYLD_LIBRARY_PATH

# Less options, set colors and line numbers
set -gx LESS '--chop-long-lines --RAW-CONTROL-CHARS'

zoxide init fish | source

direnv hook fish | source
