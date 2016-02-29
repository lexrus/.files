set fish_greeting ""

function fish_prompt
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal
  echo -n ' '
end

# Exports

set -x PATH $PATH /usr/local/sbin
set -x PATH $PATH $HOME/go/bin
set -x PATH /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin $PATH
set -x PATH $PATH $HOME/git/arcanist/bin
set -x GOPATH $HOME/go
set -x GO15VENDOREXPERIMENT 1
set -x ANSIBLE_NOCOWS 1
set -x EDITOR vim
command --search rbenv >/dev/null; and begin
  . (rbenv init -|psub)
end

# Alias

alias g="git"
alias wip="git commit -a -m WIP"
alias squish="git status -s;git commit -a --amend -C HEAD"
alias ad="arc diff"

alias v="vim"
alias a="atom"
alias s="subl"
alias c="ccat"

# Proxy
alias pon="set -x http_proxy http://127.0.0.1:7777;set -x https_proxy http://127.0.0.1:7777"
alias poff="set -e http_proxy;set -e https_proxy"

# File size
alias fs="stat -f '%z bytes'"
alias df="df -h"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Delete Apple System Logs
alias dasl="sudo -rf /private/var/log/asl/*.asl"

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
  vim +PlugUpdate
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
  vim +PlugUpdate
end

function dlaudio
  youtube-dl -f bestaudio --extract-audio --audio-format mp3 $argv
end

function gi
  curl -L -s https://www.gitignore.io/api/$argv
end

