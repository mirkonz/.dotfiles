#!/bin/sh

echo "Installing cask applications..."
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

brew cask install --appdir="/Applications" adobe-creative-cloud
brew cask install --appdir="/Applications" apptrap
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" etcher
brew cask install --appdir="/Applications" fantastical
brew cask install --appdir="/Applications" fing
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" firefox-beta
brew cask install --appdir="/Applications" franz
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" google-chrome-canary
brew cask install --appdir="/Applications" google-drive
brew cask install --appdir="/Applications" imazing
brew cask install --appdir="/Applications" istat-menus
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" namechanger
brew cask install --appdir="/Applications" parallels-desktop
brew cask install --appdir="/Applications" postman
brew cask install --appdir="/Applications" qbittorrent
brew cask install --appdir="/Applications" safari-technology-preview
brew cask install --appdir="/Applications" sequel-pro
brew cask install --appdir="/Applications" sketch
brew cask install --appdir="/Applications" sketchup
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" xquartz
brew cask install --appdir="/Applications" fork

brew cask install google-cloud-sdk

brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package quicklookase qlvideo

sleep 1
echo "Success! Cask applications are installed."