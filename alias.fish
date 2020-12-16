alias g="git"
alias wip="git commit -am WIP"
alias squash="git status -s;git commit -a --amend -C HEAD"
alias lr="lunchy restart"
alias lu="lunchy"
alias lc="colorls -r"
alias fig="docker-compose"
alias ax="axel -an 10 "

alias v="vim"
alias vi="vim"
alias s="subl"
alias c="ccat"
alias code="code-insiders"

# Weekly git log
alias wl='git log --pretty=format:"%ad: %s" --date=short --after=(date -v-6d +"%Y-%m-%d") --author=(git config user.name)'

# File size
alias fs="stat -f '%z bytes'"
alias df="df -h"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Delete Apple System Logs
alias dasl="sudo rm -rf /private/var/log/asl/*.asl"

# Delete DerivedData
alias ded="rm -rf $HOME/Library/Developer/Xcode/DerivedData"

# Open the plugin folder of Xcode
alias xcp="open $HOME/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins"

# Flush Directory Service cache
alias flushdns="dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# Recursively delete `.DS_Store` files
alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Get WAN IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Get local IP
alias localip="ipconfig getifaddr en0"
