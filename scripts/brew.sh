#!/bin/sh

echo "Installing brew packages..."

brew tap 'homebrew/versions'
brew tap 'homebrew/dupes'
brew tap 'homebrew/php'

brew update
brew upgrade

# Core
brew install antigen
brew install coreutils
brew install dockutil
brew install htop
brew install rbenv
brew install nvm
brew install python
brew install zsh

# Extra
brew install composer
brew install homebrew/apache/httpd24 --with-http2 --with-privileged-ports
brew install homebrew/php/php70 --with-httpd24
brew install kubernetes-cli
brew install mysql
brew install multitail
brew install ssh-copy-id
brew install wget --with-iri
brew install watchman
brew install yarn

brew services restart mysql

# Remove outdated versions from the cellar.
brew cleanup

sleep 1
echo "Success! Brew packages are installed."