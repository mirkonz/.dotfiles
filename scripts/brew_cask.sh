#!/bin/sh

echo "Installing cask applications..."

brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers

brew cask install font-firacode-nerd-font

brew cask install --appdir="/Applications" adobe-creative-cloud
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" apptrap
brew cask install --appdir="/Applications" balenaetcher
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" fantastical
brew cask install --appdir="/Applications" fing
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" fork
brew cask install --appdir="/Applications" fork
brew cask install --appdir="/Applications" franz
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" google-chrome-canary
brew cask install --appdir="/Applications" google-cloud-sdk
brew cask install --appdir="/Applications" google-drive-file-stream
brew cask install --appdir="/Applications" google-photos-backup-and-sync
brew cask install --appdir="/Applications" imageoptim
brew cask install --appdir="/Applications" imazing
brew cask install --appdir="/Applications" istat-menus
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" mqttfx
brew cask install --appdir="/Applications" namechanger
brew cask install --appdir="/Applications" onyx
brew cask install --appdir="/Applications" plex-media-player
brew cask install --appdir="/Applications" screens-connect
brew cask install --appdir="/Applications" sequel-pro
brew cask install --appdir="/Applications" sketchup
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" steam
brew cask install --appdir="/Applications" synology-drive
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" xquartz

brew cask install google-cloud-sdk

brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package quicklookase qlvideo

sleep 1
echo "Success! Cask applications are installed."