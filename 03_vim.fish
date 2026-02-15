# Install vim-plug
if not test -f ~/.vim/autoload/plug.vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \n        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end

# Link
rm -f /home/jules/.vimrc
rm -f /home/jules/.vimrc.plug
ln -s /home/jules/.files/.vimrc /home/jules/.vimrc
ln -s /home/jules/.files/.vimrc.plug /home/jules/.vimrc.plug
ln -s /home/jules/.files/.ctags /home/jules/.ctags

vim +PlugInstall +qall

# Inside of ~/.vim make /tmp, inside of which mkdir swap backup undo
mkdir -p /home/jules/.vim/tmp/{swap,backup,undo}

mkdir -p ~/.config
rm -rf ~/.config/nvim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
