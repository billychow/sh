#!/bin/bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install autoconf automake cmake bash-completion subversion git tmux unrar macvim \
             memcached mongodb redis-server imagemagick httpie \
             libreadline-dev libbz2-dev libsqlite3-dev npm

# setup vim
git clone https://github.com/billychow/.vim.git
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# install powerline fonts
git clone https://github.com/powerline/fonts.git ~/.vim/fonts
~/.vim/fonts/install.sh
rm -rf ~/.vim/fonts

# setup pyenv & python
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo -e '\n' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
exec $SHELL
pyenv install 2.7.10
pyenv global 2.7.10
pyenv rehash
# install tornado & sae
pip install tornado==2.1.1
pip install sae-python-dev

# setup rbenv & ruby-build
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo -e '\n' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
rbenv install 2.2.3
rbenv global 2.2.3
rbenv rehash
# setup mirror for gem source
gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/

# setup nodejs & nvm
wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh

echo -e '\n' >> ~/.bashrc
echo 'export PS1="\u@\H:\w$ "' >> ~/.bashrc
