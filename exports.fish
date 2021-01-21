# set global env
# https://github.com/fish-shell/fish-shell/issues/4103
function setenv
    set -gx $argv
end

setenv PATH $PATH /usr/local/sbin
setenv PATH $PATH $HOME/.local/bin 2>&1 | cat - > /dev/null

if [ (uname -p) = "arm" ]
  setenv PATH /opt/homebrew/bin $PATH
  setenv PATH /opt/homebrew/sbin $PATH
  setenv PATH /opt/homebrew/opt/openjdk/bin $PATH
  setenv PATH $PATH /opt/homebrew/opt/icu4c/bin
  setenv LDFLAGS $LDFLAGS "-L/opt/homebrew/opt/readline/lib"
  setenv LDFLAGS $LDFLAGS "-L/opt/homebrew/opt/ncurses/lib"
  setenv LDFLAGS $LDFLAGS "-L/opt/homebrew/opt/sqlite/lib"
  setenv LDFLAGS $LDFLAGS "-L/opt/homebrew/opt/libffi/lib"
  setenv LDFLAGS $LDFLAGS "-L/opt/homebrew/opt/icu4c/lib"
  setenv CPPFLAGS $CPPFLAGS "-I/opt/homebrew/opt/readline/include"
  setenv CPPFLAGS $CPPFLAGS "-I/opt/homebrew/opt/ncurses/include"
  setenv CPPFLAGS $CPPFLAGS "-I/opt/homebrew/opt/sqlite/include"
  setenv CPPFLAGS $CPPFLAGS "-I/opt/homebrew/opt/libffi/include"
  setenv CPPFLAGS $CPPFLAGS "-I/opt/homebrew/opt/icu4c/include"
  setenv PKG_CONFIG_PATH $PKG_CONFIG_PATH "/opt/homebrew/opt/readline/lib/pkgconfig"
  setenv PKG_CONFIG_PATH $PKG_CONFIG_PATH "/opt/homebrew/opt/ncurses/lib/pkgconfig"
  setenv PKG_CONFIG_PATH $PKG_CONFIG_PATH "/opt/homebrew/opt/sqlite/lib/pkgconfig"
  setenv PKG_CONFIG_PATH $PKG_CONFIG_PATH "/opt/homebrew/opt/libffi/lib/pkgconfig"
  setenv PKG_CONFIG_PATH $PKG_CONFIG_PATH "/opt/homebrew/opt/icu4c/lib/pkgconfig"
end

setenv ANSIBLE_NOCOWS 1
setenv LC_ALL en_US.UTF-8
setenv LANG en_US.UTF-8

setenv EDITOR vim

# rbenv
command --search rbenv >/dev/null; and begin
  . (rbenv init -|psub)
end
setenv RUBYOPT -W0

# SDKs
setenv PATH $PATH $HOME/SDKs/google-cloud-sdk/bin 2>&1 | cat - > /dev/null
setenv PATH $PATH $HOME/SDKs/flutter/bin 2>&1 | cat - > /dev/null
setenv PATH $PATH $HOME/SDKs/arcanist/arcanist/bin 2>&1 | cat - > /dev/null
setenv PATH $PATH $HOME/.pub-cache/bin 2>&1 | cat - > /dev/null

# iOSRe
setenv PATH $PATH /opt/MonkeyDev/bin 2>&1 | cat - > /dev/null
setenv MonkeyDevPath /opt/MonkeyDev

# Android
if test -d $HOME/Library/android/sdk
  setenv ANDROID_HOME $HOME/Library/android/sdk
  setenv PATH $PATH $HOME/Library/Android/sdk/platform-tools 2>&1 | cat - > /dev/null
end

# Golang
if test -d $HOME/go
  setenv GOPATH $HOME/go
  setenv GO15VENDOREXPERIMENT 1
  setenv GO111MODULE on
  setenv GOPROXY http://localhost:9090
  setenv PATH $PATH $HOME/go/bin
end

# Swiftenv
if test -d $HOME/.swiftenv
  setenv SWIFTENV_ROOT $HOME/.swiftenv 2>&1 | cat - > /dev/null
  setenv PATH $SWIFTENV_ROOT/bin $PATH 2>&1 | cat - > /dev/null
  command --search swiftenv >/dev/null; and begin
    status --is-interactive; and . (swiftenv init -|psub)
  end
end
