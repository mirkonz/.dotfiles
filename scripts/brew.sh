#!/bin/sh

echo "Installing brew packages..."

brew tap 'homebrew/versions'
brew tap 'homebrew/dupes'

brew update
brew upgrade

# Core
brew install antigen
brew install coreutils
brew install dockutil
brew install htop
brew install rbenv
brew install node
brew install nvm
brew install zsh

# Apache, PHP, MySQL
# brew install httpd
# brew install mysql
# brew install php@7.2

# Extra
brew install brew-cask-completion
brew install composer
brew install docker
brew install docker-completion
brew install docker-compose
brew install docker-compose-completion
brew install kubernetes-cli
brew install lastpass-cli --with-pinentry --with-doc
brew install multitail
brew install ssh-copy-id
brew install wget --with-iri
brew install watchman
brew install yarn

# sudo brew services restart httpd
# brew services restart php@7.2
# brew services restart mysql

# Remove outdated versions from the cellar.
brew cleanup

sleep 1
echo "Success! Brew packages are installed."
