#!/bin/sh

echo "Installing Mac App Store applications..."
brew install mas
sleep 1

mas signin --dialog mail@mirkomay.com

mas outdated
mas upgrade

mas 'Alfred', id: 405843582
mas 'Boxy SVG', id: 611658502
mas 'GIPHY Capture', id: 668208984
mas 'Spark', id: 1176895641
mas 'Transmit', id: 403388562
mas 'Xcode', id: 497799835
mas 'Magnet', id: 441258766

sleep 1
echo "Success! Mac App Store application are installed."