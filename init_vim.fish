# Install VIM
brew install vim --with-lua --with-luajit --override-system-vi

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Link
ln $HOME/.files/vimrc $HOME/.vimrc

vim +PlugInstall +qall

# Inside of ~/.vim make /tmp, inside of which mkdir swap backup undo
mkdir -p $HOME/.vim/tmp/{swap,backup,undo}

# Install Dracula theme
curl https://raw.githubusercontent.com/zenorocha/dracula-theme/master/vim/colors/dracula.vim \
    --create-dirs -o $HOME/.vim/colors/dracula.vim
