defaults write com.apple.desktopservices DSDontWriteNetworkStores true

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
  carthage
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
  imagemagick
  lynx
  mosh
  neofetch
  qrencode
  ranger
  swiftlint
  tig
  tmux
  tree
  wget
  wrk
  openjdk
)

brew_install_recipes

# This is where brew stores its binary symlinks
set binroot="$(brew --config | awk '/HOMEBREW_PREFIX/ {print $2}')"/bin
