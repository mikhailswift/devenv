#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
ln -sf $DIR/{.zshplugins,.zshrc,.zprofile,.p10k.zsh,.prettierrc} "$HOME/"
mkdir -p $HOME/.config/nvim
ln -sf $DIR/.config/nvim/* "$HOME/.config/nvim/"
