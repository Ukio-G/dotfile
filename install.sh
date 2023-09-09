#!/usr/bin/bash

# require vim xorg-xrdb rofi i3wm xbindkeys zsh (and oh-my-zsh extension) zsh-autosuggestions zsh-syntax-highlighting

# cp -r .local .xres .vim .config ~
# cp .vimrc .Xresources .xinitrc .xbindkeysrc .zshrc .gitconfig ~

soft_link_files=(.vimrc .Xresources .xinitrc .xbindkeysrc .gitconfig)

function backup_if_exist() {
    if [ -f $1 ]; then
        mv $1{,.bk}
    fi
}

for file in $soft_link_files 
do
    ln -s $file ${HOME}/$file
done

# Link to zshrc and theme must be hard
ln .zshrc ${HOME}/.zshrc
ln zkio.zsh-theme ${HOME}/.oh-my-zsh/themes/zkio.zsh-theme

mkdir -p ${HOME}/.config/i3
mkdir -p ${HOME}/.config/i3blocks
mkdir -p ${HOME}/.config/rofi

backup_if_exist ${HOME}/.config/i3/config
backup_if_exist ${HOME}/.config/i3blocks/config
backup_if_exist ${HOME}/.config/rofi/config.rasi

ln -s .config/i3/config ${HOME}/.config/i3/config
ln -s .config/i3blocks/config ${HOME}/.config/i3blocks/config

if [ -d ${HOME}/.config/rofi ]; then
    mv ${HOME}/.config/rofi{,.bk}
fi
ln -s .config/rofi ${HOME}/.config/rofi

if [ -d ${HOME}/.vim ]; then
    mv ${HOME}/.vim{,.bk}
fi
ln -s .vim ${HOME}/.vim

ln -s .xrdb_themes ${HOME}/.xrdb_themes
