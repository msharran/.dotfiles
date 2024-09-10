set -gx PATH $PATH $HOME/bin
set -gx PATH $PATH /opt/homebrew/bin 
set -gx PATH $PATH $HOME/.local/bin 

# Go
set -gx PATH $PATH $HOME/.local/go/bin 
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
if type -q /usr/libexec/java_home
    set -gx PATH $PATH $(/usr/libexec/java_home -v 11)
end

# Python
# if pyenv is installed
if type -q pyenv
    pyenv init - | source
end

# Deno 
set -gx PATH $PATH $HOME/.deno
set -gx PATH $PATH $DENO_INSTALL/bin

# Linkerd
set -gx PATH $PATH $HOME/.linkerd2/bin

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

if type -q zoxide 
    zoxide init fish | source
end

if type -q direnv
    direnv hook fish | source
end

# Snap for linux
set -gx PATH $PATH /snap/bin
