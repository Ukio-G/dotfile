#!/usr/bin/bash

# require vim xorg-xrdb rofi i3wm xbindkeys zsh (and oh-my-zsh extension) zsh-autosuggestions zsh-syntax-highlighting

# cp -r .local .xres .vim .config ~
# cp .vimrc .Xresources .xinitrc .xbindkeysrc .zshrc .gitconfig ~

HOME=/home/$(whoami)
PWD=`pwd`

soft_link_files=( .vimrc .Xresources .xinitrc .xbindkeysrc .gitconfig )

function backup_if_exist() {
    if [ -f $1 ]; then
        mv $1{,.bk}
    fi
}

for file in "${soft_link_files[@]}"
do
    echo "Create symlink to $file"
    ln -s $PWD/$file ${HOME}/$file
done


## Check oh my zsh installed

if [ ! -d ${HOME}/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


# Link to zshrc and theme must be hard
backup_if_exist ${HOME}/.zshrc
ln $PWD/.zshrc ${HOME}/.zshrc
ln $PWD/zkio.zsh-theme ${HOME}/.oh-my-zsh/themes/zkio.zsh-theme

mkdir -p ${HOME}/.config/i3
mkdir -p ${HOME}/.config/i3blocks
mkdir -p ${HOME}/.config/rofi

backup_if_exist ${HOME}/.config/i3/config
backup_if_exist ${HOME}/.config/i3blocks/config
backup_if_exist ${HOME}/.config/rofi/config.rasi

ln -s $PWD/.config/i3/config ${HOME}/.config/i3/config
ln -s $PWD/.config/i3blocks/config ${HOME}/.config/i3blocks/config

if [ -d ${HOME}/.config/rofi ]; then
    mv ${HOME}/.config/rofi{,.bk}
fi
ln -s $PWD/.config/rofi ${HOME}/.config/rofi

if [ -d ${HOME}/.vim ]; then
    mv ${HOME}/.vim{,.bk}
fi
ln -s $PWD/.vim ${HOME}/.vim

ln -s $PWD/.xrdb_themes ${HOME}/.xrdb_themes
