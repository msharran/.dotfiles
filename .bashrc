if command -v zoxide > /dev/null; then
  eval "$(zoxide init bash)"
fi

if command -v starship > /dev/null; then
    eval "$(starship init bash)"
fi

source "$HOME/.cargo/env"
if command -v cargo > /dev/null; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi
