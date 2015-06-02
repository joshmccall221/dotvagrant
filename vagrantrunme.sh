#!/bin/bash
#Dependencies
echo 'cd /home/vagrant'
cd /home/vagrant
echo 'sudo apt-get update'
sudo apt-get update


echo whoami
whoami

echo 'sudo apt-get -y install git curl vim vim-nox'
sudo apt-get -y install git curl vim vim-nox


echo '######################################'
echo '#   Solarized for vim and terminal   #'
echo '######################################'

if [ ! -d "./gnome-terminal-colors-solarized"  ]; then
    echo 'sudo git clone https://github.com/Anthony25/gnome-terminal-colors-solarized'
    su -c "git clone https://github.com/Anthony25/gnome-terminal-colors-solarized" vagrant
fi
echo '######################################'
echo '#   Solarized for terminal           #'
echo '######################################'

echo 'cd ./gnome-terminal-colors-solarized'
cd ./gnome-terminal-colors-solarized
echo 'sudo chmod +755 *.sh'
sudo chmod +755 *.sh

echo ' ./install.sh -s dark -p Default'
su -c "./install.sh -s dark -p Default" vagrant

echo 'cd /home/vagrant'
cd /home/vagrant

echo '######################################'
echo '#   Solarized for vim                #'
echo '######################################'
if [ ! -f spf13.vim.sh ]; then
   su -c " curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh" vagrant
fi
echo 'echo color sol >> /home/vagrant/.vimrc'
echo 'color sol' >> /home/vagrant/.vimrc

