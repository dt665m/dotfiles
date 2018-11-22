#!/bin/bash

#set default shell to zsh
# zsh --version
# chsh -s /bin/zsh

#install homebrew
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#install others such as go
# brew install go
#mkdir -p ~/go/bin

# install and setup antibody and terminal notifier
# brew install getantibody/tap/antibody terminal-notifier
# cp .zsh_plugins.txt ~/.zsh_plugins.txt
# antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# install powerlevel9k and nerdfonts
brew tap sambadevi/powerlevel9k
brew install powerlevel9k
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

# merge our zshrc contents if one already exists, otherwise just copy it over
if [ -f ~/.zshrc ]; then
    echo "===Merging .zshrc Files==="
    cat .zshrc | cat - ~/.zshrc > temp && rm ~/.zshrc && mv temp ~/.zshrc
else
    echo "===Copying .zshrc File"
    cp .zshrc ~/.zshrc
fi