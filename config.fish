if status --is-interactive;
  source $HOME/.files/exports.fish
  source $HOME/.files/alias.fish
end

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

function updateall
  upgrade
  switch (uname)
    case Darwin
      softwareupdate -a -i
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
      brew update --all ;and brew upgrade
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
