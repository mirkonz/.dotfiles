#!/bin/sh

echo "Installing Mac App Store applications..."
brew install mas
sleep 1

mas signin --dialog mail@mirkomay.com

mas outdated
mas upgrade

mas 'Boxy SVG', id: 611658502
mas 'Spark', id: 1176895641
mas 'Transmit', id: 403388562
mas 'Xcode', id: 497799835
mas 'Magnet', id: 441258766
mas 'AutoMounter', id: 1160435653

sleep 1
echo "Success! Mac App Store application are installed."