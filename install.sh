#!/bin/sh

PROMPT_TIMEOUT = 15

################################################################
# Install new user for MacOS
################################################################
install_apps () {

  # # Make zsh your default shell
  # chsh -s /bin/zsh

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
  brew bundle --global --file ./dotfiles/Brewfile

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
}

# Confirm user is happy to proceed with package installations
echo -e "\nDid you create a backup? (y/N)"
read -t $PROMPT_TIMEOUT -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  install_apps
fi