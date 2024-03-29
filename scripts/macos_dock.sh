#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Spark.app"
dockutil --no-restart --add "/Applications/Fantastical 2.app"
dockutil --no-restart --add '' --type spacer --section apps --after 1
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Google Chrome Canary.app"
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add '' --type spacer --section apps --after 2
dockutil --no-restart --add "/Applications/Franz.app"
dockutil --no-restart --add "/Applications/Messages.app"
dockutil --no-restart --add "/Applications/FaceTime.app"
dockutil --no-restart --add '' --type spacer --section apps --after 3
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/Fork.app"
dockutil --no-restart --add "/Applications/Sequel Pro.app"
dockutil --no-restart --add "/Applications/Transmit.app"
dockutil --no-restart --add "/Applications/Xcode.app"
dockutil --no-restart --add "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
dockutil --no-restart --add '' --type spacer --section apps --after 4
dockutil --no-restart --add "/Applications/Adobe Lightroom CC/Adobe Lightroom CC.app"
dockutil --no-restart --add "/Applications/Adobe Photoshop CC 2019/Adobe Photoshop CC 2018.app"
dockutil --no-restart --add "/Applications/Adobe Illustrator CC 2019/Adobe Illustrator.app"
dockutil --no-restart --add "/Applications/Adobe Premiere Pro CC 2019/Adobe Premiere Pro CC 2018.app"
dockutil --no-restart --add "/Applications/Adobe After Effects CC 2019/Adobe After Effects CC 2018.app"
dockutil --no-restart --add "/Applications/Boxy SVG.app"
dockutil --no-restart --add "/Applications/SketchUp 2017/SketchUp.app"
dockutil --no-restart --add '' --type spacer --section apps --after 5
dockutil --no-restart --add "/Users/mirko/Applications/Chrome Apps.localized/Default apdfllckaahabafndbhieahigkjlhalf.app"
dockutil --no-restart --add "/Applications/Notes.app"
dockutil --no-restart --add "/Applications/Photos.app"
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/Applications/App Store.app"
dockutil --no-restart --add '' --type spacer --section apps --after 6
dockutil --no-restart --add "/Applications/System Preferences.app"

dockutil --no-restart --add '/Applications' --section others --display folder --view list --sort name
dockutil --no-restart --add '/Users/mirko/Downloads' --section others --display folder --view list --sort dateadded

killall Dock

echo "Success! Dock is set."