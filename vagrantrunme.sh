#!/bin/bash
#Dependencies
#apt-get -y install ubuntu-desktop
echo 'cd /home/vagrant'
cd /home/vagrant

  echo 'sudo apt-get update'
  sudo apt-get update
 
 
 echo whoami
 whoami
 
   echo 'sudo apt-get -y install git curl vim vim-nox tmux'
   sudo apt-get -y install git curl vim vim-nox tmux
   
   
    scho '######################################'
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
 
  sudo apt-get update
  echo '#################################################################'
  echo '#  NPM: curl -sL https://deb.nodesource.com/setup | sudo bash - #'
  echo '#################################################################'
  
  cd /home/vagrant
  curl -sL https://deb.nodesource.com/setup | sudo bash -
  sudo apt-get install -y nodejs
 
  sudo apt-get update
  echo '##################################################'
  echo '#  http-server: npm install http-server -g       #'
  echo '##################################################'
  cd /home/vagrant
  npm install http-server -g
 
 
  sudo apt-get update
   echo '########################################################'
   echo '#  Ruby: apt-get install rbenv                         #'
   echo '#  SASS:  su -c "gem install sass" vagrant             #'
   echo '#  Compass:  su -c "gem install comapass" vagrant      #'
   echo '#  css_parser:  su -c "gem install css_parser" vagrant #'
   echo '########################################################'
   cd /home/vagrant
   apt-get install rbenv && sudo su -c "gem install sass" && sudo su -c "gem install compass" && sudo su -c "gem install css_parser" 
  
  
  sudo apt-get update
  echo '##########################################################'
  echo '#  http-server :  curl https://npmjs.org/install.sh | sh #'
  echo '#                    && npm install http-server -g       #'
  echo '##########################################################'
  cd /home/vagrant
  # sudo su -c "curl https://npmjs.org/install.sh | sh && sudo npm install http-server -g " vagrant 
  sudo su -c "sudo npm install http-server -g " vagrant 
