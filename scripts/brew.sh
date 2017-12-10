#!/bin/sh

if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

echo "Installing brew packages..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap 'homebrew/versions'
brew tap 'homebrew/dupes'
brew tap 'homebrew/php'
brew tap 'Goles/battery'

brew update
brew upgrade

brew install antigen
brew install coreutils
brew install composer
brew install dockutil
brew install git
brew install homebrew/apache/httpd24 --with-http2 --with-privileged-ports
brew install homebrew/php/php70 --with-httpd24
brew install htop
brew install kubernetes-cli
brew install mysql
brew install multitail
brew install nvm
brew install python
brew install rbenv
brew install ssh-copy-id
brew install wget --with-iri
brew install watchman
brew install yarn
brew install zsh

brew services restart mysql

# Remove outdated versions from the cellar.
brew cleanup

sleep 1
echo "Success! Brew packages are installed."