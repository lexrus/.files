# Install vim-plug
if not test -f ~/.vim/autoload/plug.vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \n        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end

# Link
rm -f $HOME/.vimrc
rm -f $HOME/.vimrc.plug
ln -s $HOME/.files/.vimrc $HOME/.vimrc
ln -s $HOME/.files/.vimrc.plug $HOME/.vimrc.plug
ln -s $HOME/.files/.ctags $HOME/.ctags

vim +PlugInstall +qall

# Inside of ~/.vim make /tmp, inside of which mkdir swap backup undo
mkdir -p $HOME/.vim/tmp/{swap,backup,undo}

mkdir -p ~/.config
rm -rf ~/.config/nvim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
