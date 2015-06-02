#!/bin/bash
#Dependencies
cd /home/vagrant
sudo apt-get update
#sudo -u root@localhost


echo whoami
echo whoami
echo whoami
echo whoami
echo whoami
whoami
whoami
whoami
whoami
whoami
whoami

echo 'sudo apt-get -y install git curl vim vim-nox'
sudo apt-get -y install git curl vim vim-nox


echo '#Solarized for vim and terminal'
echo '#Solarized for vim and terminal'
echo '#Solarized for vim and terminal'
echo '#Solarized for vim and terminal'

if [ ! -d "./gnome-terminal-colors-solarized"  ]; then
    echo 'sudo git clone https://github.com/Anthony25/gnome-terminal-colors-solarized'
    echo 'sudo git clone https://github.com/Anthony25/gnome-terminal-colors-solarized'
    echo 'sudo git clone https://github.com/Anthony25/gnome-terminal-colors-solarized'
    echo 'sudo git clone https://github.com/Anthony25/gnome-terminal-colors-solarized'
    echo 'sudo git clone https://github.com/Anthony25/gnome-terminal-colors-solarized'
    su -c "git clone https://github.com/Anthony25/gnome-terminal-colors-solarized" vagrant
fi

echo 'cd ./gnome-terminal-colors-solarized'
cd ./gnome-terminal-colors-solarized
echo 'sudo chmod +755 *.sh'
sudo chmod +755 *.sh

echo ' ./install.sh -s dark -p Default'
su -c "./install.sh -s dark -p Default" vagrant

echo 'cd /home/vagrant'
cd /home/vagrant

if [ ! -f spf13.vim.sh ]; then
   su -c " curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh" vagrant
fi
echo 'echo color sol >> /home/vagrant/.vimrc'
echo 'color sol' >> /home/vagrant/.vimrc

