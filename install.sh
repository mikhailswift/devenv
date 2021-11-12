#!/bin/bash
set -x
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
ln -sf $DIR/{.zshplugins,.zshrc,.zprofile,.p10k.zsh,.prettierrc} "$HOME/"
mkdir -p $HOME/.config/{dunst,fontconfig/conf.d,kitty,nvim,sway,waybar,wofi}
ln -sf $DIR/.config/dunst/* "$HOME/.config/dunst/"
ln -sf $DIR/.config/fontconfig/conf.d/* "$HOME/.config/fontconfig/conf.d/"
ln -sf $DIR/.config/kitty/* "$HOME/.config/kitty/"
ln -sf $DIR/.config/nvim/* "$HOME/.config/nvim/"
ln -sf $DIR/.config/sway/* "$HOME/.config/sway/"
ln -sf $DIR/.config/waybar/* "$HOME/.config/waybar/"
ln -sf $DIR/.config/wofi/* "$HOME/.config/wofi/"
