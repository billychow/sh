#!/bin/bash
sudo apt-get -y update && sudo apt-get -y upgrade
sudo apt-get -y install build-essential subversion git
sudo apt-get -y install tmux screen proxychains indicator-multiload hamster-indicator indicator-china-weather
sudo apt-get -y install p7zip-full rar unrar chromium-browser filezilla

# setup vim
sudo apt-get -y install vim-gnome
git clone https://github.com/billychow/.vim.git
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# development tools
sudo apt-get -y install memcached mongodb redis-server imagemagick

# setup pyenv & python
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo -e '\n' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
exec $SHELL
sudo apt-get -y install libreadline-dev libbz2-dev libsqlite3-dev
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
sudo apt-get install -y libreadline-dev
rbenv install 2.2.3
rbenv global 2.2.3
rbenv rehash
# setup mirror for gem source
gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/


# setup nodejs
sudo apt-get -y install npm

echo -e '\n' >> ~/.bashrc
echo 'export PS1="\u@\H:\w$ "' >> ~/.bashrc
