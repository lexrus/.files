# Install NeoVIM
brew install neovim/neovim/neovim

# Inside of ~/.vim make /tmp, inside of which mkdir swap backup undo
cd ~/.vim
mkdir tmp
cd tmp/
mkdir swap backup undo
cd

# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall

# install YCM
cd ~/.vim/bundle/YouCompleteMe
./install.sh --gocode-completer --clang-completer
cd
