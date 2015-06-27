#!/bin/bash
#Use Protobox with this? Explore this more. Added to Tasks.
date1=$(date +"%s")
echo '######################################'
echo '# Dependencies:  sudo apt-get update #'
echo '######################################'
      sudo apt-get update
echo '##########################################'
echo '# Essentials                             #'
echo '##########################################'
     sudo apt-get -y install git curl vim vim-nox tmux gnome-terminal vim-gnome
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
    echo 'set background=dark' >> /home/vagrant/.vimrc
    echo 'let g:solarized_termcolors=16' >> /home/vagrant/.vimrc
    echo 'color solarized' >> /home/vagrant/.vimrc
    echo 'TERM="screen-256color-bce"' >> /home/vagrant/.profile
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
echo '##########################################################'
echo '#   zsh                                                  #'
echo '##########################################################'
    sudo apt-get -y install zsh
    if [ ! -f /home/vagrant/.zshrc ]; then
    touch /home/vagrant/.zshrc
    fi
    su -c "sudo /vagrant/zsh" vagrant
    cat /home/vagrant/.bash_aliases >> /home/vagrant/.zshrc
    echo 'tm'>> /home/vagrant/.zshrc
    chsh -s /bin/zsh vagrant
echo '##########################################################'
echo '#   Install I3 Tiling                                    #'
echo '##########################################################'
    echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
    apt-get update
    apt-get --allow-unauthenticated install sur5r-keyring
    apt-get update
    apt-get install -y i3
echo '##########################################################'
echo '#   Install pkg-config                                   #'
echo '##########################################################'
    sudo sudo apt-get install pkg-config
echo '##########################################################'
echo '#   Install NGREP                                        #'
echo '##########################################################'
    sudo apt-get -y install ngrep
echo '##########################################################'
echo '#   Install Golang                                       #'
echo '##########################################################'
    sudo apt-get -y install gccgo-go
echo '##########################################################'
echo '#   Install Java 8                                       #'
echo '##########################################################'
    sudo apt-get -y install openjdk-8-jdk
echo '##########################################################'
echo '#   Install Mono                                         #'
echo '##########################################################'
    sudo apt-get -y install mono-complete
echo '##########################################################'
echo '#   Install Docker                                       #'
echo '##########################################################'
    sudo apt-get -y install docker.io
echo '##########################################################'
echo '#   Install Node                                         #'
echo '##########################################################'
    sudo apt-get -y install nodejs
echo '##########################################################'
echo '#   Install Typescript                                   #'
echo '##########################################################'
    sudo npm install -g typescript
echo '##########################################################'
echo '#   Install Coffee Script                                #'
echo '##########################################################'
    sudo npm install -g coffee-script
echo '##########################################################'
echo '#   Install Angular                                      #'
echo '##########################################################'
    sudo npm install angular
echo '##########################################################'
echo '#   Install QUnit                                        #'
echo '##########################################################'
    sudo npm install qunit
echo '##########################################################'
echo '#   Install Strongloop                                   #'
echo '##########################################################'
    sudo npm install -g strongloop
echo '##########################################################'
echo '#       Thats all folks!                                 #'
echo '##########################################################'
    date2=$(date +"%s")
    diff=$(($date2-$date1))
    echo "$(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
exit
