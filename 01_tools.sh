#!/bin/bash

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
  chisel
  coreutils
  ctags
  curl
  fish
  git
  git-lfs
  htop-osx
  httpstat
  hub
  lynx
  mosh
  qrencode
  ranger
  tig
  tmux
  tree
  wget
  wrk
)

brew_install_recipes