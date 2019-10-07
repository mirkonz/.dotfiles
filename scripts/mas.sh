#!/bin/sh

echo "Installing Mac App Store applications..."
brew install mas
sleep 1

mas signin --dialog mail@mirkomay.com

mas outdated
mas upgrade

mas 'AutoMounter', id: 1160435653
mas 'Boxy SVG', id: 611658502
mas 'LittleIpsum', id: 405772121
mas 'Magnet', id: 441258766
mas 'Remote Mouse', id: 403195710
mas 'Slack', id: 803453959
mas 'Spark', id: 1176895641
mas 'Transmit', id: 403388562
mas 'VPN Unlimited - WiFi Proxy', id: 727593140
mas 'Xcode', id: 497799835

AusweisApp2
Citrix Workspace
Cocoapotrace
MyHarmony

sleep 1
echo "Success! Mac App Store application are installed."