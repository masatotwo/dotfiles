#!/bin/zsh

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# ====================
#
# Base
#
# ====================

# Disable auto-capitalization
# defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# ====================
#
# Dock
#
# ====================

# Disable animation at application launch
# defaults write com.apple.dock launchanim -bool false

# ====================
#
# Finder
#
# ====================

# Disable animation
# defaults write com.apple.finder DisableAllAnimations -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show files with all extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display the status bar
# defaults write com.apple.finder ShowStatusBar -bool true

# Display the path bar
# defaults write com.apple.finder ShowPathbar -bool true

# ====================
#
# SystemUIServer
#
# ====================

# Display date, day, and time in the menu bar
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE) H:mm:ss"

# Display battery level in the menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Disable the Character Accent Menu
defaults write -g ApplePressAndHoldEnabled -bool false

# for app in "Dock" \
#   "Finder" \
#   "SystemUIServer"; do
#   killall "${app}" &> /dev/null
# done