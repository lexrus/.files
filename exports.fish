# set global env
# https://github.com/fish-shell/fish-shell/issues/4103
function setenv
    set -gx $argv
end


if [ (uname -p) = arm ]
    fish_add_path /opt/homebrew/bin /opt/homebrew/sbin /opt/homebrew/opt/openjdk/bin /opt/homebrew/opt/icu4c/bin /usr/local/sbin $HOME/.claude/local $HOME/.cargo/bin
    for pkg in readline ncurses sqlite libffi icu4c
        setenv LDFLAGS $LDFLAGS -L/opt/homebrew/opt/$pkg/lib
        setenv CPPFLAGS $CPPFLAGS -I/opt/homebrew/opt/$pkg/include
        setenv PKG_CONFIG_PATH $PKG_CONFIG_PATH /opt/homebrew/opt/$pkg/lib/pkgconfig
    end
end

setenv HOMEBREW_AUTO_UPDATE_SECS 259200
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
fish_add_path $HOME/SDKs/google-cloud-sdk/bin $HOME/fvm/default/bin $HOME/SDKs/arcanist/arcanist/bin $HOME/.pub-cache/bin

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
    fish_add_path $HOME/go/bin
end

# Swiftenv
if test -d $HOME/.swiftenv
    setenv SWIFTENV_ROOT $HOME/.swiftenv 2>&1 | cat - >/dev/null
    fish_add_path $SWIFTENV_ROOT/bin
    command --search swiftenv >/dev/null; and begin
        status --is-interactive; and . (swiftenv init -|psub)
    end
end

# Mise
if test -e $HOME/.local/bin/mise
    ~/.local/bin/mise activate fish | source
end

# Windsurf
if test -e $HOME/.codeium/windsurf/bin
    fish_add_path $HOME/.codeium/windsurf/bin
end

# Antigravity
if test -e $HOME/.antigravity/antigravity/bin
    fish_add_path $HOME/.antigravity/antigravity/bin
end
