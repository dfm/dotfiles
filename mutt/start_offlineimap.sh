#!/bin/bash

launchctl unload -w ~/Library/LaunchAgents/ca.danfm.offlineimap.plist
cp offlineimap.plist ~/Library/LaunchAgents/ca.danfm.offlineimap.plist
launchctl load -w ~/Library/LaunchAgents/ca.danfm.offlineimap.plist
