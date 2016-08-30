set fish_greeting ""

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l red (set_color -o red)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  # Show git branch and dirty state
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name) ' '

    if [ (_is_git_dirty) ]
      set git_info $red $git_branch
    else
      set git_info $green $git_branch
    end
    echo -n -s $git_info $normal
  end

  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal
  echo -n ' '
end

# Swiftenv
command --search swiftenv >/dev/null; and begin
  status --is-interactive; and . (swiftenv init -|psub)
end

# Exports

set -x PATH $PATH $HOME/go/bin 2>&1 | cat - > /dev/null
set -x PATH $PATH $HOME/git/arcanist/bin 2>&1 | cat - > /dev/null
set -x PATH $PATH $HOME/Dropbox/bin 2>&1 | cat - > /dev/null
set -x GOPATH $HOME/go 2>&1 | cat - > /dev/null
set -x SWIFTENV_ROOT $HOME/.swiftenv 2>&1 | cat - > /dev/null
set -x PATH $SWIFTENV_ROOT/bin $PATH 2>&1 | cat - > /dev/null
status --is-interactive; and . (swiftenv init -|psub)
set -x GO15VENDOREXPERIMENT 1
set -x ANSIBLE_NOCOWS 1
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

switch (uname)
  case Darwin
    set -x PATH $PATH /usr/local/sbin | cat - > /dev/null
    set -x EDITOR nvim
  case Linux
    set -x EDITOR vim
end

command --search rbenv >/dev/null; and begin
  . (rbenv init -|psub)
end

# Alias

alias g="git"
alias wip="git commit -am WIP"
alias squash="git status -s;git commit -a --amend -C HEAD"
alias ad="arc diff"
alias al="arc land --onto develop"
alias lr="lunchy restart"
alias lu="lunchy"
alias fig="docker-compose"
alias ax="axel -an 10 "

alias v="nvim"
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
alias dasl="sudo rm -rf /private/var/log/asl/*.asl"

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
  switch (uname)
    case Darwin
      brew update --all ;and brew upgrade --all
      pod repo update
      softwareupdate -a -i
    case Linux
      apt-get update ;and apt-get upgrade -y
  end
  vim +PlugUpdate +qall
  pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U
  pip install --upgrade pip
  gem update
  go get -u all
end

function upgrade
  switch (uname)
    case Darwin
      brew update --all ;and brew upgrade --all
    case Linux
      apt-get update ;and apt-get upgrade -y
  end
end

function cleanup
  switch (uname)
    case Darwin
      brew cleanup ;and brew cask cleanup
    case Linux
      apt-get clean; apt-get autoremove -y
  end
end

function www
  echo 'http://0.0.0.0:8000'
  python -m SimpleHTTPServer 8000
end

function vimu
  vim +PlugUpdate +qall
end

function dlaudio
  youtube-dl -f bestaudio --extract-audio --audio-format mp3 $argv
end

function gi
  curl -L -s https://www.gitignore.io/api/$argv
end

