#!/bin/sh

################################################################
# Backup old user setting to Dropbox
################################################################

BACKUP_FOLDER=~/Dropbox/$USER.backup

echo "Backing up important dotfile into $BACKUP_FOLDER"

# Dotfiles
mkdir -p $BACKUP_FOLDER
cp -Rp \
    ~/.aliases \
    ~/.docker \
    ~/.dockercfg \
    ~/.gitconfig \
    ~/.gitignore_global \
    ~/.npmrc \
    ~/.npmrcs \
    ~/.wakatime.cfg \
    ~/.yarnrc \
    ~/.viminfo \
    ~/.vim \
    ~/.vscode \
    ~/.ssh \
    ~/.z   \
    ~/.zsh_history \
        $BACKUP_FOLDER

echo "Do not run this script in one go. hit ctrl-c NOW"
read -n 1
exit 1

# Whats still needed?
brew leaves
brew cask list
npm list -g --depth=0
yarn global ls --depth=0
# Update brew.sh brew_cask.sh

# Global System Configuration ?
ls -la /Library/Preferences/SystemConfiguration/
mkdir -p $BACKUP_FOLDER/rootLibrary/Preferences/SystemConfiguration/
cp -Rp /Library/Preferences/SystemConfiguration/* $BACKUP_FOLDER/rootLibrary/Preferences/SystemConfiguration/

# User System Preferences ?
ls -la ~/Library/Preferences/
mkdir -p $BACKUP_FOLDER/Library/Preferences/
cp -Rp ~/Library/Preferences/x.plist $BACKUP_FOLDER/Library/Preferences/

# Application settings & software licenses ?
ls -la ~/Library/Application\ Support
mkdir -p $BACKUP_FOLDER/Library/"Application Support"/
cp -Rp ~/Library/"Application Support"/x $BACKUP_FOLDER/Library/"Application Support"/

# Fonts ?
ls -la ~/Library/Fonts/
cp -Rp ~/Library/Fonts $BACKUP_FOLDER/Library/

# Also consider...
# random git branches you never pushed anywhere?
# git untracked files (or local gitignored stuff). stuff you never added, but probably want..
# usage logs you've been keeping.
# maybe ~/Pictures and such
