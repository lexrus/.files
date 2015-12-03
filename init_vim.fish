# Install NeoVIM
brew install vim --with-lua --with-luajit --override-system-vi

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Link
ln $HOME/.files/vimrc $HOME/.vimrc
ln -s $HOME/.vim $HOME/.config/nvim
ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim

vim +PlugInstall +qall

# Install YCM
cd $HOME/.vim/plugged/YouCompleteMe
git submodule update --init --recursive
python3 install.py --gocode-completer --clang-completer
cd


# Inside of ~/.vim make /tmp, inside of which mkdir swap backup undo
cd $HOME/.vim
mkdir tmp
cd tmp/
mkdir swap backup undo
cd
