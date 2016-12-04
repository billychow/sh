#!/usr/bin/env bash

set -x
sudo apt-get -y update && sudo apt-get -y upgrade
sudo apt-get -y install build-essential autoconf subversion git vim-gnome tmux screen proxychains privoxy \
                                p7zip-full rar unrar chromium-browser filezilla \
                                indicator-multiload indicator-china-weather \
                                ibus-table-wubi \
                                openjdk-8-jdk-headless python-pip httpie \
                                libreadline-dev libbz2-dev libsqlite3-dev libmysqlclient-dev libmagickwand-dev

# setup rbenv & ruby-build
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv && git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# setup pyenv & python
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

# setup nvm
wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh

# setup sublime text
cd ~/Downloads
wget https://download.sublimetext.com/Sublime%20Text%202.0.2%20x64.tar.bz2 && tar xf Sublime\ Text\ 2.0.2\ x64.tar.bz2 && \
sudo mv Sublime\ Text\ 2 /opt/ && sudo ln -s /opt/Sublime\ Text\ 2/sublime_text /usr/local/bin/subl && \
sudo sh -c 'cat <<EOD > /usr/share/applications/sublime.desktop
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
'
# set sublime as default text-editor in stead of gedit
sudo sed -i "s/gedit.desktop/sublime.desktop/g" /usr/share/applications/defaults.list
sudo sed -i "s/firefox.desktop/chromium-browser.desktop/g" /usr/share/applications/defaults.list
cd -

# set system proxy
pip install gfwlist2pac
pyenv rehash
wget https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
gfwlist2pac -i gfwlist.txt -f proxy.pac -p "SOCKS5 127.0.0.1:1080;"
sudo mv proxy.pac /etc/proxy.pac
rm -f gfwlist.txt
dconf write /system/proxy/mode "'auto'"
dconf write /system/proxy/autoconfig-url "'file:///etc/proxy.pac'"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
