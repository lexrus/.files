set bundler_plugin_execs pod fastlane xcpretty

if status --is-interactive;
  source $HOME/.files/exports.fish
  source $HOME/.files/alias.fish
end

set fish_greeting ""
function fish_greeting
  # neofetch
  fortune 2>/dev/null
end

function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s ' (prompt_pwd)

  set_color normal
end

function updateall
  upgrade
  switch (uname)
    case Darwin
      softwareupdate -a -i
  end
  vim +PlugUpdate +qall
  pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U
  pip3 install --upgrade pip
  gem update
  cleanup
end

function upgrade
  switch (uname)
    case Darwin
      brew update ;and brew upgrade --display-times -q
    case Linux
      apt-get update ;and apt-get upgrade -y
  end
end

function cleanup
  switch (uname)
    case Darwin
      brew cleanup
    case Linux
      apt-get clean; apt-get autoremove -y
  end
  gem clean
end

function www
  echo 'http://0.0.0.0:8000'
  python3 -m http.server 8000
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

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set openssl_path (brew --prefix openssl@1.1)
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$openssl_path"
