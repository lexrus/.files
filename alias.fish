alias g="git"
alias wip="git commit -am WIP"
alias squash="git status -s;git commit -a --amend -C HEAD"
alias v="vim"
alias vi="vim"
alias z="/usr/local/bin/zed -n"

# Weekly git log
alias wl='git log --pretty=format:"%ad: %s" --date=short --after=(date -v-6d +"%Y-%m-%d") --author=(git config user.name)'

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
