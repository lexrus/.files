# Disable opening and closing window animations.

defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Disable the animations for opening Quick Look windows.

defaults write -g QLPanelAnimationDuration -float 0

# Increase window resize speed for Cocoa applications.

defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Disable window animations and Get Info animations in the Finder.

defaults write com.apple.finder DisableAllAnimations -bool true

# Don’t animate opening applications from the Dock.

defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations.

defaults write com.apple.dock expose-animation-duration -float 0.1

# Remove the Dock auto-hide delay.

defaults write com.apple.Dock autohide-delay -float 0

# Disable send and reply animations in Mail.app.

defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# Reduce the render delay inside the Safari browser.

defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25


