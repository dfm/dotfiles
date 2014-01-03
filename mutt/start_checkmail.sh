#!/bin/bash

launchctl unload -w ~/Library/LaunchAgents/io.dfm.checkmail.plist
cp checkmail.plist ~/Library/LaunchAgents/io.dfm.checkmail.plist
launchctl load -w ~/Library/LaunchAgents/io.dfm.checkmail.plist
