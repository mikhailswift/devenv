#!/bin/bash
set -x
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
ln -sf $DIR/{.zshplugins,.zshrc,.p10k.zsh,.prettierrc} "$HOME/"
mkdir -p $HOME/{.local/bin,.config/{dunst,fontconfig/conf.d,i3,kitty,nvim,picom,polybar,rofi}}
ln -sf $DIR/{lock.sh,screencast,setup_comm_workspace.sh} "$HOME/.local/bin/"
ln -sf $DIR/.config/dunst/* "$HOME/.config/dunst/"
ln -sf $DIR/.config/fontconfig/conf.d/* "$HOME/.config/fontconfig/conf.d/"
ln -sf $DIR/.config/i3/* "$HOME/.config/i3/"
ln -sf $DIR/.config/kitty/* "$HOME/.config/kitty/"
ln -sf $DIR/.config/nvim/* "$HOME/.config/nvim/"
ln -sf $DIR/.config/picom/* "$HOME/.config/picom/"
ln -sf $DIR/.config/polybar/* "$HOME/.config/polybar/"
ln -sf $DIR/.config/rofi/* "$HOME/.config/rofi/"
ln -sf $DIR/.xinitrc "$HOME/.xinitrc"
ln -sf $DIR/.zprofile "$HOME/.zprofile"
