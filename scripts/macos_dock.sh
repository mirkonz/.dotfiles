#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Fantastical 2.app"
dockutil --no-restart --add "Applications/Spark.app"
dockutil --no-restart --add '' --type spacer
dockutil --no-restart --add "Applications/Safari.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Google Chrome Canary.app"
dockutil --no-restart --add '' --type spacer
dockutil --no-restart --add "/Applications/Franz.app"
dockutil --no-restart --add "/Applications/Messages.app"
dockutil --no-restart --add "/Applications/FaceTime.app"
dockutil --no-restart --add '' --type spacer
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/SourceTree.app"
dockutil --no-restart --add "/Applications/Sequel Pro.app"
dockutil --no-restart --add "/Applications/FileZilla.app"
dockutil --no-restart --add "/Applications/Transmit.app"
dockutil --no-restart --add "/Applications/Dash.app"
dockutil --no-restart --add "/Applications/Xcode.app"
dockutil --no-restart --add "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
dockutil --no-restart --add "/Applications/Fabric.app"
dockutil --no-restart --add "/Applications/KeePassX.app"
dockutil --no-restart --add '' --type spacer
dockutil --no-restart --add "/Applications/Sketch.app"
dockutil --no-restart --add "/Applications/Adobe Lightroom Classic CC/Adobe Lightroom Classic CC.app"
dockutil --no-restart --add "/Applications/Adobe Photoshop CC 2018/Adobe Photoshop CC 2018.app"
dockutil --no-restart --add "/Applications/Adobe Illustrator CC 2018/Adobe Illustrator.app"
dockutil --no-restart --add "/Applications/Adobe Premiere Pro CC 2017/Adobe Premiere Pro CC 2017.app"
dockutil --no-restart --add "/Applications/Adobe After Effects CC 2018/Adobe After Effects CC 2018.app"
dockutil --no-restart --add "/Applications/Boxy SVG.app"
dockutil --no-restart --add "/Applications/SketchUp 2017/SketchUp.app"
dockutil --no-restart --add '' --type spacer
dockutil --no-restart --add "/Users/mirko/Applications/Chrome Apps.localized/Default apdfllckaahabafndbhieahigkjlhalf.app"
dockutil --no-restart --add "/Applications/Notes.app"
dockutil --no-restart --add "/Applications/Photos.app"
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/Applications/Utilities/AirPort Utility.app"
dockutil --no-restart --add "/Applications/App Store.app"
dockutil --no-restart --add '' --type spacer
dockutil --no-restart --add "/Applications/System Preferences.app"

dockutil --no-restart --add '/Applications' --section others --display folder --view list --sort name
dockutil --no-restart --add '/Users/mirko/Downloads' --section others --display folder --view list --sort dateadded
dockutil --no-restart --add '/Users/mirko/Library/Parallels/Applications Menus/{8f8fca0a-2275-4cb8-bd30-4f657128c443} Applications Menu.localized' --section others --display folder --view list --sort kind

killall Dock

echo "Success! Dock is set."