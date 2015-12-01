#!/usr/bin/env bash

sudo apt-get -y update && sudo apt-get -y upgrade
sudo apt-get -y install build-essential subversion git httpie proxychains
sudo apt-get -y install tmux screen proxychains indicator-multiload hamster-indicator indicator-china-weather ibus-googlepinyin ibus-table-wubi
sudo apt-get -y install p7zip-full rar unrar chromium-browser filezilla

# setup vim
sudo apt-get -y install vim-gnome
git clone https://github.com/billychow/.vim.git
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# install powerline fonts
git clone https://github.com/powerline/fonts.git ~/.vim/fonts
~/.vim/fonts/install.sh
rm -rf ~/.vim/fonts

# setup sublime text
cd ~/Downloads
wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2
tar xf Sublime\ Text\ 2.0.2\ x64.tar.bz2
sudo mv Sublime\ Text\ 2 /opt/
sudo ln -s /opt/Sublime\ Text\ 2/sublime_text /usr/local/bin/sublime
sudo cat <<EOD > /usr/share/applications/sublime.desktop
[Desktop Entry]
Version=1.0
Name=Sublime Text 2
GenericName=Text Editor

Exec=sublime
Terminal=false
Icon=/opt/Sublime Text 2/Icon/48x48/sublime_text.png
Type=Application
Categories=TextEditor;IDE;Development
X-Ayatana-Desktop-Shortcuts=NewWindow

[NewWindow Shortcut Group]
Name=New Window
Exec=sublime -n
TargetEnvironment=Unity
EOD
#sudo sublime /usr/share/applications/defaults.list


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

# setup nodejs & nvm
sudo apt-get -y install npm
wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
