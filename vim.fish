# Install VIM
brew install ctags
brew install vim --with-lua --with-luajit --override-system-vi

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Link
unlink $HOME/.vimrc | rm $HOME/.vimrc
unlink $HOME/.vimrc.plug | rm $HOME/.vimrc.plug
ln -s $HOME/.files/.vimrc $HOME/.vimrc
ln -s $HOME/.files/.vimrc.plug $HOME/.vimrc.plug
ln -s $HOME/.files/.ctags $HOME/.ctags

vim +PlugInstall +qall

# Inside of ~/.vim make /tmp, inside of which mkdir swap backup undo
mkdir -p $HOME/.vim/tmp/{swap,backup,undo}
