export EDITOR='nvim'
export NVIMHOME="$XDG_CONFIG_HOME/nvim"

function v() {
  if [ -n "$1" ]; then
    nvim "$1"
  else
    nvim .
  fi
}
