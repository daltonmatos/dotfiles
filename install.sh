#!/bin/bash
cd
git clone https://github.com/daltonmatos/dotfiles .dotfiles

cd .dotfiles
git submodule init
git submodule update

cd
ln -s .dotfiles/zsh/zshenv .zshenv
ln -s .dotfiles/zsh .zsh

