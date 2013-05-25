#! /usr/bin/bash -v

# dotfiles
ln -vsf ~/dotfiles/.vimrc ~/
ln -vsf ~/dotfiles/.gitconfig ~/
ln -vsf ~/dotfiles/.gitignore ~/
ln -vsf ~/dotfiles/.profile ~/

# NeoBundle(vim)
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

if [ `uname` = "Darwin" ]; then
    # application support
    mkdir -p ~/Library/Application\ Support/KeyRemap4MacBook
    ln -vsf ~/dotfiles/application_supprt/private.xml ~/Library/Application\ Support/KeyRemap4MacBook/private.xml
fi
