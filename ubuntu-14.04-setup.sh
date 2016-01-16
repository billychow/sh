#!/usr/bin/env bash

sudo -u root apt-get -y update && sudo -u root apt-get -y upgrade
sudo -u root apt-get -y install build-essential subversion git vim-gnome zsh \
                                tmux screen proxychains privoxy indicator-multiload hamster-indicator indicator-china-weather \
                                ibus-googlepinyin ibus-table-wubi \
                                p7zip-full rar unrar chromium-browser filezilla \
                                nginx php5-cli php5-fpm php5-mcrypt php5-gd php5-imagick php5-mysqlnd php5-xsl \
                                php5-apc php5-memcache php5-curl php5-redis php5-tidy php5-xmlrpc \
                                npm memcached mongodb redis-server imagemagick openjdk-7-jdk httpie \
                                libreadline-dev libbz2-dev libsqlite3-dev libmysqlclient-dev libmagickwand-dev

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# setup vim
git clone https://github.com/billychow/.vim.git
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# install powerline fonts
#git clone https://github.com/powerline/fonts.git ~/.vim/fonts
~/.vim/fonts/install.sh
rm -rf ~/.vim/fonts

# setup sublime text
cd ~/Downloads
wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2
tar xf Sublime\ Text\ 2.0.2\ x64.tar.bz2
sudo -u root mv Sublime\ Text\ 2 /opt/
sudo -u root ln -s /opt/Sublime\ Text\ 2/sublime_text /usr/local/bin/subl
sudo -u root cat <<EOD > /usr/share/applications/sublime.desktop
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
Exec=subl -n
TargetEnvironment=Unity
EOD
# set sublime as default text-editor in stead of gedit
sudo -u root sed -i "s/gedit.desktop/sublime.desktop/g" /usr/share/applications/defaults.list
sudo -u root sed -i "s/firefox.desktop/chromium-browser/g" /usr/share/applications/defaults.list

# setup rbenv & ruby-build
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo -e '\n' >> ~/.{ba,z}shrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.{ba,z}shrc
echo 'eval "$(rbenv init -)"' >> ~/.{ba,z}shrc
exec $SHELL
rbenv install 2.2.3
rbenv global 2.2.3
rbenv rehash
# setup mirror of gem source
gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/

# setup pyenv & python
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo -e '\n' >> ~/.{ba,z}shrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.{ba,z}shrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.{ba,z}shrc
echo 'eval "$(pyenv init -)"' >> ~/.{ba,z}shrc
exec $SHELL
pyenv install 2.7.10
pyenv global 2.7.10
pyenv rehash
# install tornado & sae
pip install tornado==2.1.1
pip install sae-python-dev

# setup nvm
wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh

# set system proxy
pip install gfwlist2pac
pyenv rehash
wget https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
gfwlist2pac -i gfwlist.txt -f proxy.pac -p "SOCKS5 127.0.0.1:1080;"
sudo -u root mv proxy.pac /etc/proxy.pac
rm -f gfwlist.txt
dconf write /system/proxy/mode "'auto'"
dconf write /system/proxy/autoconfig-url "'file:///etc/proxy.pac'"