#!/bin/bash

echo "linking bashrc, vimrc, tmux.conf"
ln -s $(HOME)/dotfiles/bashrc ~/.bashrc
ln -s $(HOME)/dotfiles/vimrc ~/.vimrc
ln -s $(HOME)/dotfiles/tmux.conf ~/.tmux.conf
ln -s $(HOME)/dotfiles/zshrc ~/.zshrc
ln -s $(HOME)/dotfiles/gitconfig ~/.gitconfig
ln -s $(HOME)/dotfiles/doom.d ~/.doom.d
ln -s $(HOME)/dotfiles/nvim ~/.config/nvim
