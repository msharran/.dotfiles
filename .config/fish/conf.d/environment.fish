fish_add_path $HOME/bin
fish_add_path /opt/homebrew/bin 
fish_add_path $HOME/.local/bin 

# Go
set -gx GOPATH $HOME/go
fish_add_path $GOROOT/bin
fish_add_path $GOPATH/bin
set -gx GO111MODULE on
set -gx CGO_ENABLED 0

# Node
fish_add_path $HOME/.npm-global/bin

# Ruby
fish_add_path $HOME/.rvm/bin

# Java
fish_add_path $(/usr/libexec/java_home -v 11)

# Python
pyenv init - | source

# Deno 
fish_add_path /Users/sharranm/.deno
fish_add_path $DENO_INSTALL/bin

# Linkerd
fish_add_path /Users/sharranm/.linkerd2/bin

# k8s
fish_add_path $HOME/.krew/bin

# Rust
fish_add_path $HOME/.cargo/bin

# C
# Add homebrew C headers and libs to compiler paths (for both gcc and clang)
set -gx CPATH $(brew --prefix)/include $CPATH
set -gx LIBRARY_PATH $(brew --prefix)/lib $LIBRARY_PATH

# Brew luarocks
# export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"
set -gx DYLD_LIBRARY_PATH "$(brew --prefix)/lib" $DYLD_LIBRARY_PATH

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
# export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"
set -gx DYLD_LIBRARY_PATH "$(brew --prefix)/lib" $DYLD_LIBRARY_PATH

# Less options, set colors and line numbers
set -gx LESS '--chop-long-lines --RAW-CONTROL-CHARS'

zoxide init fish | source

direnv hook fish | source
