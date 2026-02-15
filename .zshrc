# PATH settings ###############################################################

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.claude/local:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# SDKs
export PATH="$HOME/SDKs/google-cloud-sdk/bin:$PATH"
export PATH="$HOME/SDKs/arcanist/arcanist/bin:$PATH"
export PATH="$HOME/fvm/default/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"

# Android
if [[ -d "$HOME/Library/android/sdk" ]]; then
  export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
fi

# Golang
if [[ -d "$HOME/go" ]]; then
  export PATH="$HOME/go/bin:$PATH"
fi

# Swiftenv
if [[ -d "$HOME/.swiftenv" ]]; then
  export PATH="$HOME/.swiftenv/bin:$PATH"
  if command -v swiftenv &>/dev/null; then
    eval "$(swiftenv init -)"
  fi
fi

# Mise
if [[ -e "$HOME/.local/bin/mise" ]]; then
  eval "$(~/.local/bin/mise activate zsh --silent)"
fi

# Windsurf
if [[ -e "$HOME/.codeium/windsurf/bin" ]]; then
  export PATH="$HOME/.codeium/windsurf/bin:$PATH"
fi

# Aliases #####################################################################

alias g="git"
alias wip="git commit -am WIP"
alias squash="git status -s;git commit -a --amend -C HEAD"
alias v="vim"
alias vi="vim"
alias s="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Weekly git log
alias wl='git log --pretty=format:"%ad: %s" --date=short --after=$(date -v-6d +"%Y-%m-%d") --author=$(git config user.name)'

# File size
alias fs="stat -f '%z bytes'"
alias df="df -h"

# URL-encode strings
alias urlencode='python3 -c "import sys, urllib.parse as ul; print(ul.quote_plus(sys.argv[1]))"'

# Delete Apple System Logs
alias dasl="sudo rm -rf /private/var/log/asl/*.asl"

# Delete DerivedData
alias ded="rm -rf $HOME/Library/Developer/Xcode/DerivedData"

# Flush SPM caches
alias dspm="rm -rf $HOME/Library/Caches/org.swift.swiftpm/;rm -rf $HOME/Library/org.swift.swiftpm"

# SymbolicateCrash
alias symbolicatecrash="/Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash"

# Flush Directory Service cache
alias flushdns="dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# Recursively delete `.DS_Store` files
alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Get WAN IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Get local IP
alias localip="ipconfig getifaddr en0"

eval "$(rbenv init - zsh)"
