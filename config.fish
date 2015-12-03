set fish_greeting ""

function fish_prompt
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal
  echo -n ' '
end

# Exports

set -gx PATH $PATH /usr/local/sbin
set -x GOPATH $HOME/go
set -x GO15VENDOREXPERIMENT 1
command --search rbenv >/dev/null; and begin
  set -gx PATH $PATH $HOME/.rbenv/shims
  . (rbenv init -|psub)
end

# Alias for editors

#alias vim="nvim"
alias v="vim"
alias a="atom"
alias s="subl"

# File size
alias fs="stat -f '%z bytes'"
alias df="df -h"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true & killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false & killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Activate fuzzy mode for Xcode 7. See https://twitter.com/hamzasood/status/621739073108111360
alias xcfuzzy="defaults write com.apple.dt.Xcode IDECodeCompletionFuzzyMode -int 3"
alias xcfuzzyoff="defaults delete com.apple.dt.Xcode IDECodeCompletionFuzzyMode"

# Delete DerivedData
alias ded="rm -rf $HOME/Library/Developer/Xcode/DerivedData"

# Open any workspace if it exists, otherwise open the project
alias ox="open ./*.xcworkspace 2>/dev/null; open ./*.xcodeproj 2>/dev/null"

# Open the plugin folder of Xcode
alias xcp="open $HOME/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# Recursively delete `.DS_Store` files
alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Get WAN IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Get local IP
alias localip="ipconfig getifaddr en1"

function update
  brew update --all ;and brew upgrade --all
end

function updateall
  brew update --all ;and brew upgrade --all
  brew reinstall --HEAD neovim
  vim +BundleUpdate
end

function upgrade
  brew cask update
end

function cleanup
  brew cleanup ;and brew cask cleanup
end

function www
  twistd -onl - --pidfile=/tmp/twistd.pid web --path=./ --port=8000
end

function vimu
  vim +BundleUpdate
end

function dlaudio
    youtube-dl -f bestaudio --extract-audio --audio-format mp3 $argv
end
