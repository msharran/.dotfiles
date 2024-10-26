<<<<<<< HEAD
# if .bashrc exists, source it
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
=======
if command -v zoxide > /dev/null; then
  eval "$(zoxide init bash)"
fi

if command -v cargo > /dev/null; then
  export PATH="$HOME/.cargo/bin:$PATH"
  source "$HOME/.cargo/env"
>>>>>>> b9fa1cf (nvim - nvim tree maps)
fi
