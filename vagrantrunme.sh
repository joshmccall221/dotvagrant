#!/bin/bash
date1=$(date +"%s")
 echo '######################################'
 echo '# Dependencies:  sudo apt-get update #'
 echo '######################################'
     sudo apt-get update  # > /dev/null 2>&1
 echo '##########################################'
 echo '# sudo apt-get install GUI               #'
 echo '##########################################'
      apt-get -y install gnome-shell # > /dev/null 2>&1
 #    apt-get -y install lightdm #> /dev/null 2>&1
 #    apt-get -y install ubuntu-desktop > /dev/null 2>&1
 echo '##########################################################'
 echo '# Guest Additions:                                       #'
 echo '##########################################################'
      sudo apt-get -y install linux-headers-$(uname -r) build-essential dkms # > /dev/null 2>&1
        #sudo apt-get -y install linux-headers-generic linux-headers-$(uname -r) build-essential dkms
      sudo ln -s /opt/VBoxGuestAdditions-4.3.28/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions 
      wget http://dlc-cdn.sun.com/virtualbox/4.3.28/VBoxGuestAdditions_4.3.28.iso # > /dev/null 2>&1
      sudo  mkdir /media/VBoxGuestAdditions
      sudo  mount -o loop,ro VBoxGuestAdditions_4.3.28.iso /media/VBoxGuestAdditions/
      sudo  sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run # > /dev/null 2>&1
echo '##########################################################'
echo '#  Laravel/Homstead user logon:                          #'
echo '##########################################################'
     if [ ! -f /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf]; then
         touch /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
     fi
     echo 'greeter-show-manual-login=true' >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
        echo 'greeter-show-manual-login=true' >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
 echo '##########################################################'
 echo '# Start Gnome-Shell:                                     #'
 echo '##########################################################'
      sudo gdm &
echo '##########################################'
echo '# cd /home/vagrant'
echo '# whoami'
echo '##########################################'
    cd /home/vagrant
    echo ' whoami'
    whoami
echo '##########################################'
echo '# Essentials                             #'
echo '# sudo apt-get -y install git curl vim vim-nox tmux gnome-terminal vim-gnome google-chrome'
echo '##########################################'
     sudo apt-get -y install git curl vim vim-nox tmux gnome-terminal vim-gnome
#     cd /tmp
#     wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb > /dev/null 2>&1
#     sudo dpkg -i google-chrome-stable_current_i386.deb > /dev/null 2>&1
#     sudo apt-get -f install > /dev/null 2>&1
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
     sudo apt-get install dconf-cli > /dev/null 2>&1
     echo 'cd ./gnome-terminal-colors-solarized'
     cd ./gnome-terminal-colors-solarized
     echo 'sudo chmod +755 *.sh'
     sudo chmod +755 *.sh
     echo ' ./install.sh -s dark -p Default'
     su -c "./install.sh -s dark -p Default > /dev/null 2>&1" vagrant
     cd
     wget --no-check-certificate https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-dark > /dev/null 2>&1
     mv dircolors.ansi-dark .dircolors
     eval `dircolors ~/.dircolors`
     echo 'cd /home/vagrant'
     cd /home/vagrant
echo '######################################'
echo '#   Solarized for vim                #'
echo '######################################'
    if [ ! -f spf13.vim.sh ]; then
        su -c " curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh > /dev/null 2>&1" vagrant
    fi
echo 'echo color solarized >> /home/vagrant/.vimrc'
echo 'color solarized' >> /home/vagrant/.vimrc
echo 'set background=dark' >> /home/vagrant/.vimrc
echo '##################################################'
echo '#   tmux: https://gist.github.com/diginc/8531848 #'
echo '##################################################'
    if [ ! -f /home/vagrant/.bash_alliases  ]; then
        git clone https://gist.github.com/b329c4a84a274c906aa6.git bash_alliases
        cd bash_alliases
        cp .bash_aliases  /home/vagrant/.bash_aliases
        cd /home/vagrant
        source  /home/vagrant/.bash_alliases 
    fi
    if [ ! -f /home/vagrant/.tmux.conf ]; then
        git clone https://gist.github.com/8525360.git tmux_conf
        cd tmux_conf
        cp gistfile1.txt /home/vagrant/.tmux.conf
        cd /home/vagrant
        source /home/vagrant/.bashrc 
    fi
     echo 'tm' >> /home/vagrant/.bashrc 
     source /home/vagrant/.bashrc 
     sudo apt-get update > /dev/null 2>&1
echo '#################################################################'
echo '#  NPM: curl -sL https://deb.nodesource.com/setup | sudo bash - #'
echo '#################################################################'
     cd /home/vagrant
     curl -sL https://deb.nodesource.com/setup | sudo bash -
     sudo apt-get -y install  nodejs # > /dev/null 2>&1
     sudo apt-get update # > /dev/null 2>&1
echo '##################################################'
echo '#  http-server: npm install http-server -g       #'
echo '##################################################'
     cd /home/vagrant
     sudo npm install http-server -g # > /dev/null 2>&1
     sudo apt-get update # > /dev/null 2>&1
echo '##########################################################'
echo '# simplehttpserver :sudo npm install simplehttpserver -g #'
echo '#                                                        #'
echo '##########################################################'
     cd /home/vagrant
     sudo su -c "sudo npm install simplehttpserver -g > /dev/null 2>&1" vagrant 
echo '########################################################'
echo '#  Ruby:                                               #'
echo '#  SASS:  su -c "gem install sass" vagrant             #'
echo '#  Compass:  su -c "gem install comapass" vagrant      #'
echo '#  css_parser:  su -c "gem install css_parser" vagrant #'
echo '########################################################'
     cd /home/vagrant
     echo '#  Ruby: apt-get install rbenv                         #'
     #sudo apt-get -y install rbenv  > /dev/null 2>&1
     sudo wget --no-check-certificate https://raw.githubusercontent.com/joshfng/railsready/master/railsready.sh && echo 1 | bash  railsready.sh # > /dev/null 2>&1
     echo '#  SASS:  su -c "gem install sass" vagrant             #'
     sudo apt-get update # > /dev/null 2>&1
     sudo su -c "gem install sass > /dev/null 2>&1" 
     echo '#  Compass:  su -c "gem install comapass" vagrant      #'
     sudo apt-get update # > /dev/null 2>&1
     sudo su -c "gem install compass > /dev/null 2>&1"  
#     echo '#  css_parser:  su -c "gem install css_parser" vagrant #'
#     sudo apt-get update > /dev/null 2>&1
#     sudo su -c "gem install css_parser > /dev/null 2>&1" 
#     sudo apt-get update > /dev/null 2>&1
echo '##########################################################'
echo '#  Laravel/Homstead user logon:                                         #'
echo '##########################################################'
     echo 'greeter-show-manual-login=true' >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf

echo '##########################################################'
echo '#   zsh                                                  #'
echo '##########################################################'
    #http://codurance.com/2015/03/16/installing-zprezto-a-quick-guide/
    sudo apt-get -y install zsh
    if [ ! -f /home/vagrant/.zshrc ]; then
    touch /home/vagrant/.zshrc
    fi
    sudo rm  -R ~/.z*
    zsh -c 'git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"'
    zsh -c 'setopt EXTENDED_GLOB
      for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
          ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done'
    sudo chsh -s /bin/zsh
    echo '##########################################################'
    echo '#   Chrome                                               #'
    echo '##########################################################'
    cd /tmp
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt-get -f -y install
    cd /home/vagrant
    echo '##########################################################'
    echo '##########################################################'
     echo 'Thats all folks!'
echo '########################################################'
    date2=$(date +"%s")
    diff=$(($date2-$date1))
    echo "$(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
exit
