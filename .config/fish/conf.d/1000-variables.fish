set -gx PATH $HOME/bin $PATH
set -gx PATH $PATH $HOME/.local/bin
set -gx PATH /opt/homebrew/bin $PATH

# Go
set -gx GOPATH $HOME/go
set -gx PATH $PATH $GOROOT/bin $GOPATH/bin
set -gx GO111MODULE on
set -gx CGO_ENABLED 0

# Node
set -gx PATH $PATH $HOME/.npm-global/bin

# Ruby
set -gx PATH $PATH $HOME/.rvm/bin

# Java
set -gx JAVA_HOME $(/usr/libexec/java_home -v 11)

# Deno 
set -gx DENO_INSTALL /Users/sharranm/.deno
set -gx PATH $DENO_INSTALL/bin $PATH

# Ripgrep
set -gx RIPGREP_CONFIG_PATH $HOME/.ripgreprc

# Linkerd
set -gx PATH $PATH /Users/sharranm/.linkerd2/bin

# XDG_CONFIG_HOME
set -gx XDG_CONFIG_HOME $HOME/.config

# Bat
set -gx BAT_THEME "Catppuccin Mocha"

# C
# Add homebrew C headers and libs to compiler paths (for both gcc and clang)
set -gx CPATH $(brew --prefix)/include $CPATH
set -gx LIBRARY_PATH $(brew --prefix)/lib $LIBRARY_PATH

# k8s
set -gx PATH $PATH $HOME/.krew/bin

# Editor
set -gx EDITOR 'nvim'
set -gx NVIMHOME "$XDG_CONFIG_HOME/nvim"

# FZF
# --height 40% --layout reverse --border
set -gx FZF_DEFAULT_OPTS "--height 40% --layout reverse --border"

# Brew luarocks
# export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"
set -gx DYLD_LIBRARY_PATH "$(brew --prefix)/lib" $DYLD_LIBRARY_PATH

# Rust
fish_add_path $HOME/.cargo/bin
