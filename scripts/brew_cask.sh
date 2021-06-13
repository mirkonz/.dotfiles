#!/bin/sh

echo "Installing cask applications..."

brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers
brew tap buo/cask-upgrade

brew install --cask font-firacode-nerd-font

brew install --cask --appdir="/Applications" adobe-creative-cloud
brew install --cask --appdir="/Applications" alfred
brew install --cask --appdir="/Applications" apptrap
brew install --cask --appdir="/Applications" balenaetcher
brew install --cask --appdir="/Applications" dropbox
brew install --cask --appdir="/Applications" fantastical
brew install --cask --appdir="/Applications" fing
brew install --cask --appdir="/Applications" firefox
brew install --cask --appdir="/Applications" fork
brew install --cask --appdir="/Applications" franz
brew install --cask --appdir="/Applications" google-chrome
brew install --cask --appdir="/Applications" google-chrome-canary
brew install --cask --appdir="/Applications" google-cloud-sdk
brew install --cask --appdir="/Applications" google-drive-file-stream
brew install --cask --appdir="/Applications" google-photos-backup-and-sync
brew install --cask --appdir="/Applications" imageoptim
brew install --cask --appdir="/Applications" iina
brew install --cask --appdir="/Applications" imazing
brew install --cask --appdir="/Applications" istat-menus
brew install --cask --appdir="/Applications" iterm2
brew install --cask --appdir="/Applications" keepassxc
brew install --cask --appdir="/Applications" keka
brew install --cask --appdir="/Applications" libreoffice
brew install --cask --appdir="/Applications" mqtt-explorer
brew install --cask --appdir="/Applications" namechanger
brew install --cask --appdir="/Applications" onyx
brew install --cask --appdir="/Applications" plex-media-player
brew install --cask --appdir="/Applications" screens-connect
brew install --cask --appdir="/Applications" sequel-pro
brew install --cask --appdir="/Applications" sketchup
brew install --cask --appdir="/Applications" sonos
brew install --cask --appdir="/Applications" spotify
brew install --cask --appdir="/Applications" spotmenu
brew install --cask --appdir="/Applications" steam
brew install --cask --appdir="/Applications" synology-drive
brew install --cask --appdir="/Applications" visual-studio-code
brew install --cask --appdir="/Applications" vlc
brew install --cask --appdir="/Applications" xquartz

brew install --cask google-cloud-sdk

brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package quicklookase qlvideo

sleep 1
echo "Success! Cask applications are installed."