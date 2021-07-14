# set global env
# https://github.com/fish-shell/fish-shell/issues/4103
function setenv
    set -gx $argv
end

fish_add_path /usr/local/sbin

if [ (uname -p) = "arm" ]
  fish_add_path /opt/homebrew/bin
  fish_add_path /opt/homebrew/sbin $PATH
  fish_add_path /opt/homebrew/opt/openjdk/bin
  fish_add_path /opt/homebrew/opt/icu4c/bin
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
fish_add_path $HOME/SDKs/google-cloud-sdk/bin
fish_add_path $HOME/fvm/default/bin
fish_add_path $HOME/SDKs/arcanist/arcanist/bin
fish_add_path $HOME/.pub-cache/bin

# iOSRe
fish_add_path /opt/MonkeyDev/bin
setenv MonkeyDevPath /opt/MonkeyDev

# Android
if test -d $HOME/Library/android/sdk
  setenv ANDROID_HOME $HOME/Library/android/sdk
  fish_add_path $HOME/Library/Android/sdk/platform-tools
end

# Golang
if test -d $HOME/go
  setenv GOPATH $HOME/go
  setenv GO15VENDOREXPERIMENT 1
  setenv GO111MODULE on
  setenv GOPROXY http://localhost:9090
  fish_add_path $HOME/go/bin
end

# Swiftenv
if test -d $HOME/.swiftenv
  setenv SWIFTENV_ROOT $HOME/.swiftenv 2>&1 | cat - > /dev/null
  fish_add_path $SWIFTENV_ROOT/bin
  command --search swiftenv >/dev/null; and begin
    status --is-interactive; and . (swiftenv init -|psub)
  end
end
