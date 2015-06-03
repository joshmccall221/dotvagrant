#!/bin/bash


  echo '######################################'
  echo '# Dependencies:  sudo apt-get update #'
  echo '######################################'

   sudo apt-get update > /dev/null 2>&1
  echo '##########################################'
  echo '#    sudo apt-get install ubuntu-desktop #'
  echo '##########################################'
   apt-get -y install ubuntu-desktop
 
   echo 'cd /home/vagrant'
   cd /home/vagrant
 
  
   echo whoami
   whoami
  
    echo 'sudo apt-get -y install git curl vim vim-nox tmux'
    sudo apt-get -y install git curl vim vim-nox tmux
    
    
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
   sudo apt-get -y install  nodejs
  
  sudo apt-get update > /dev/null 2>&1
   echo '##################################################'
   echo '#  http-server: npm install http-server -g       #'
   echo '##################################################'
   cd /home/vagrant
   sudo npm install http-server -g
  
  
   sudo apt-get update > /dev/null 2>&1
    echo '########################################################'
    echo '#  Ruby:                                               #'
    echo '#  SASS:  su -c "gem install sass" vagrant             #'
    echo '#  Compass:  su -c "gem install comapass" vagrant      #'
    echo '#  css_parser:  su -c "gem install css_parser" vagrant #'
    echo '########################################################'
    cd /home/vagrant
    echo '#  Ruby: apt-get install rbenv                         #'
    #sudo apt-get -y install rbenv 
    sudo wget --no-check-certificate https://raw.githubusercontent.com/joshfng/railsready/master/railsready.sh && echo 1 | bash  railsready.sh
    echo '#  SASS:  su -c "gem install sass" vagrant             #'
   sudo apt-get update > /dev/null 2>&1
    sudo su -c "gem install sass" 
    echo '#  Compass:  su -c "gem install comapass" vagrant      #'
   sudo apt-get update > /dev/null 2>&1
    sudo su -c "gem install compass"  
    echo '#  css_parser:  su -c "gem install css_parser" vagrant #'
   sudo apt-get update > /dev/null 2>&1
    sudo su -c "gem install css_parser" 
   
   
   sudo apt-get update > /dev/null 2>&1
   echo '##########################################################'
   echo '#  http-server :                                         #'
   echo '#                                                        #'
   echo '##########################################################'
   cd /home/vagrant
   sudo su -c "sudo gem install SimpleHTTPServer --pre" vagrant 


 echo '##########################################################'
 echo '#  Laravel/Homstead user logon:                                         #'
 echo '##########################################################'
 echo 'greeter-show-manual-login=true' >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf

 echo '##########################################################'
  echo '# Guest Additions:                                       #'
  echo '##########################################################'
  echo 'greeter-show-manual-login=true' >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
   sudo apt-get -y install linux-headers-generic build-essential dkms
   wget http://dlc-cdn.sun.com/virtualbox/4.3.28/VBoxGuestAdditions_4.3.28.iso
   sudo mkdir /media/VBoxGuestAdditions
   sudo mount -o loop,ro VBoxGuestAdditions_4.3.28.iso /media/VBoxGuestAdditions
   sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
   rm VBoxGuestAdditions_4.3.28.iso
   sudo umount /media/VBoxGuestAdditions
   sudo rmdir /media/VBoxGuestAdditions
