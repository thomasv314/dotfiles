#!/bin/zsh
if [ -z "$1" ]; then
    echo "usage: setup.sh <env_type>"
    echo "  env_type: personal or work"
    exit 2
fi

if ! [[ -f $HOME/.thomas ]]; then
  echo "$1" > $HOME/.thomas
else
  echo "$HOME/.thomas already exists. skipping.:"
fi

declare -a symlinx=(
  ".tmux"
  ".tmux.conf"
  ".vim"
  ".config"
  ".zsh"
  ".zshrc"
)

for dfile in "${symlinx[@]}"; do
  ln -sv "$HOME/dotfiles/$dfile" $HOME/$i
done
