function setenv
    set -gx $argv
end
# See https://github.com/fish-shell/fish-shell/issues/4103

set -x PATH /opt/homebrew/bin $PATH
set -g PATH /opt/homebrew/opt/openjdk/bin $PATH
set -x PATH $PATH /usr/local/sbin
set -x PATH $PATH $HOME/Dropbox/bin 2>&1 | cat - > /dev/null
set -x PATH $PATH $HOME/.local/bin 2>&1 | cat - > /dev/null

set -x ANSIBLE_NOCOWS 1
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x EDITOR vim

# rbenv
command --search rbenv >/dev/null; and begin
  . (rbenv init -|psub)
end
set -x RUBYOPT -W0

# SDKs
set -x PATH $PATH $HOME/SDKs/google-cloud-sdk/bin 2>&1 | cat - > /dev/null
set -x PATH $PATH $HOME/SDKs/flutter/bin 2>&1 | cat - > /dev/null
set -x PATH $PATH $HOME/SDKs/arcanist/arcanist/bin 2>&1 | cat - > /dev/null
set -x PATH $PATH $HOME/.pub-cache/bin 2>&1 | cat - > /dev/null

# iOSRe
set -x PATH $PATH /opt/MonkeyDev/bin 2>&1 | cat - > /dev/null
set -x MonkeyDevPath /opt/MonkeyDev

# Android
if test -d $HOME/Library/android/sdk
  set -x ANDROID_HOME $HOME/Library/android/sdk
  set -x PATH $PATH $HOME/Library/Android/sdk/platform-tools 2>&1 | cat - > /dev/null
end

# Golang
if test -d $HOME/go
  set -x GOPATH $HOME/go
  set -x GO15VENDOREXPERIMENT 1
  set -x GO111MODULE on
  set -x GOPROXY http://localhost:9090
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
