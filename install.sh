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
xcode-select --install


# Install homebrew in ~/.homebrew
mkdir $HOME/.homebrew && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C $HOME/.homebrew
export PATH=$HOME/.homebrew/bin:$HOME/.homebrew/sbin:$PATH

# Install Python
sudo easy_install pip
sudo pip install psutil
sudo pip install wakatime

# Stop and unload pre-installed apache
sudo apachectl stop
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null

# Install brew packages
./scripts/brew.sh

# Install cask packages
./scripts/brew_cask.sh

# Install Mac App Store packages
./scripts/mas.sh

# Install NPM packages
./scripts/npm.sh

# Setup Mac System defaults
sh .macos

# Setup Mac Dock
./scripts/macos_dock.sh

# Symlinks dotfiles into ~/
./scripts/symlink-dotfiles.sh

# Symlinks dropbox dotfiles into ~/
./scripts/symlink-dotfiles-dropbox.sh

echo "Installation complete."

echo "Just one more thing."
echo "Create crontab manually (symlink does not work). Please see 'crontab' file."
