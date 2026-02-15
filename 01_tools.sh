#!/bin/bash

echo "brew update"
brew update

# Install Homebrew recipes.
function brew_install_recipes() {
  echo "Installing Homebrew recipes: ${recipes[*]}"
  brew install "${recipes[@]}"
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
  htop
  httpstat
  hub
  lazygit
  lynx
  mosh
  qrencode
  ranger
  tig
  tmux
  tree
  wget
  wrk
  mise
)

brew_install_recipes
