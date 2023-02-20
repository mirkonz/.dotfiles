#!/bin/sh

################################################################
# Install new user for MacOS
################################################################

# Make zsh your default shell
chsh -s /bin/zsh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Update software
sudo softwareupdate -i -a

# Install Command Line Tools for Xcode (Available on a fresh install of macOS)
sudo xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade
brew bundle --global --file ./Brewfile

# Setup Mac System defaults
sh .macos

# Setup Mac Dock
./scripts/macos_dock.sh

# Symlinks dotfiles into ~/
./scripts/symlink-dotfiles.sh

# Symlinks dropbox dotfiles into ~/
# ./scripts/symlink-dotfiles-dropbox.sh

echo "Installation complete."

echo "Just one more thing."
echo "In order to run cronjobs you need to run `crontab` manually (symlinks do NOT work). Please see 'crontab' file."
