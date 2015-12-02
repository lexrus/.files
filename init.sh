#!/bin/bash

export PATH="/usr/local/sbin:$PATH"

# Install Homebrew.
if [[ ! "$(type -P brew)" ]]; then
  echo "Installing Homebrew"
  true | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Exit if, for some reason, Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && echo "Homebrew failed to install." && return 1

echo "brew doctor"
brew doctor

echo "brew update"
brew update

# Install Homebrew recipes.
function brew_install_recipes() {
  echo "Installing Homebrew recipes: ${recipes[*]}"
  for recipe in "${recipes[@]}"; do
    brew install $recipe
  done
}

# Homebrew recipes
recipes=(
  axel
  coreutils
  ctags
  curl
  ffmpeg
  findutils
  fish
  git
  git-extras
  htop-osx
  hub
  imagemagick
  libsodium
  libxml2
  lynx
  mackup
  mercurial
  moreutils
  mosh
  openssl
  qrencode
  ranger
  rename
  renameutils
  swiftlint
  tig
  tmux
  tree
  wget
  wrk
)

brew_install_recipes

# This is where brew stores its binary symlinks
set binroot="$(brew --config | awk '/HOMEBREW_PREFIX/ {print $2}')"/bin

# htop
if [[ "$(type -P $binroot/htop)" ]] && [[ "$(stat -L -f "%Su:%Sg" "$binroot/htop")" != "root:wheel" || ! "$(($(stat -L -f "%DMp" "$binroot/htop") & 4))" ]]; then
  echo "Updating htop permissions"
  sudo chown root:wheel "$binroot/htop"
  sudo chmod u+s "$binroot/htop"
fi

# Exit if, for some reason, Fish is not installed.
[[ ! "$(type -P fish)" ]] && e_error "Fish failed to install." && return 1

if ! grep -q "/usr/local/bin/fish" "/etc/shells"; then
  echo "Add fish to /etc/shells."
  command -v fish | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "/usr/local/bin/fish" ]]; then
  chsh -s "$(command -v fish)" "${USER}"
fi

if [[ ! -d $HOME/.config/fish ]]; then
  mkdir $HOME/.config/fish
  ln -s $HOME/.files/config.fish $HOME/.config/fish/config.fish
fi

echo "Done."
