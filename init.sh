#!/bin/bash

export PATH="/usr/local/sbin:$PATH"

unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
   source mac.sh
elif [[ "$unamestr" == 'Linux' ]]; then
   apt-get install fish -y
fi

# htop
if [[ "$(type -P $binroot/htop)" ]] && [[ "$(stat -L -f "%Su:%Sg" "$binroot/htop")" != "root:wheel" || ! "$(($(stat -L -f "%DMp" "$binroot/htop") & 4))" ]]; then
  echo "Updating htop permissions"
  sudo chown root:wheel "$binroot/htop"
  sudo chmod u+s "$binroot/htop"
fi

# Exit if, for some reason, Fish is not installed.
[[ ! "$(type -P fish)" ]] && e_error "Fish failed to install." && return 1

fish=`which fish`
if ! grep -q "$fish" "/etc/shells"; then
  echo "Add fish to /etc/shells."
  command -v fish | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$fish" ]]; then
  chsh -s "$(command -v fish)" "${USER}"
fi

if [[ ! -d $HOME/.config/fish ]]; then
  mkdir -p $HOME/.config/fish
fi

if [[ ! -L $HOME/.config/fish/config.fish ]]; then
  rm $HOME/.config/fish/config.fish
fi

if [[ ! -h $HOME/.gemrc ]]; then
  ln -s $HOME/.files/.gemrc $HOME/.gemrc
fi

ln -s $HOME/.files/config.fish $HOME/.config/fish/config.fish

if [[ ! -h $HOME/.lldbinit ]]; then
  ln -s $HOME/.files/.lldbinit $HOME/.lldbinit
fi

if [[ ! -h $HOME/.config/neofetch/config.conf ]]; then
  mkdir -p $HOME/.config/neofetch/
  ln -s $HOME/.files/neofetch.conf $HOME/.config/neofetch/config.conf
fi

"$fish" vim.fish

echo "Done."
