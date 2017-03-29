set -x PATH $PATH /usr/local/sbin | cat - > /dev/null
set -x PATH $PATH /usr/local/Cellar/node/7.7.4/bin 2>&1 | cat - > /dev/null
set -x PATH $PATH $HOME/Dropbox/bin 2>&1 | cat - > /dev/null
set -x PATH $PATH $HOME/Documents/google-cloud-sdk/bin 2>&1 | cat - > /dev/null
set -x PATH $PATH $HOME/Documents/flutter/bin 2>&1 | cat - > /dev/null

set -x ANSIBLE_NOCOWS 1
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x EDITOR nvim

# Golang

if test -d $HOME/go
  set -x GOPATH $HOME/go
  set -x GO15VENDOREXPERIMENT 1
  set -x PATH $PATH $HOME/go/bin
end

# Swiftenv

if test -d $HOME/.swiftenv
  set -x SWIFTENV_ROOT $HOME/.swiftenv 2>&1 | cat - > /dev/null
  set -x PATH $SWIFTENV_ROOT/bin $PATH 2>&1 | cat - > /dev/null
  command --search swiftenv >/dev/null; and begin
    status --is-interactive; and . (swiftenv init -|psub)
  end
end

# rbenv

command --search rbenv >/dev/null; and begin
  . (rbenv init -|psub)
end
