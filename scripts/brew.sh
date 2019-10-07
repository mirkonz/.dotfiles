#!/bin/sh

echo "Installing brew packages..."

brew update
brew upgrade

# Core
brew install antigen
brew install coreutils
brew install dockutil
brew install ffmpeg
brew install htop
brew install imagemagick
brew install rbenv
brew install node
brew install nvm
brew install vim
brew install zsh

# Extra
brew install brew-cask-completion
brew install composer
brew install docker
brew install docker-completion
brew install docker-compose
brew install docker-compose-completion
brew install kubernetes-cli
brew install lastpass-cli --with-doc
brew install multitail
brew install ssh-copy-id
brew install wget
brew install watchman
brew install yarn

# Remove outdated versions from the cellar.
brew cleanup

sleep 1
echo "Success! Brew packages are installed."
