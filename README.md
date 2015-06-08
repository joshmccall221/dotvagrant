# dotvagrant
You put the lime in the coconut and shake it all up!

## Motivation / About
To be able to have a consistent "portable" work environment with familiar tools anywhere you go. Starting with Laravel/Homestead, you can toggle features in the provisioning script (vagrantrunme.sh). 


### Note:
* Username/Password: vagrant/vagrant
* Root Username/Password: root/VAGRANT
* mounted folders:
 * /user_home => mounts host home directory
 * /vagrant/ => mounts 'dotvagrant'
 * /vagrant-data/ => mounts '..' or the parent of 'dotvagrat'
* gui - gnome-shell
* vb.memory = "5025"

## Included with Laravel Homestead:
* Ubuntu 14.04
* PHP 5.6
* HHVM
* Nginx
* MySQL
* Postgres
* Node (With Bower, Grunt, and Gulp)
* Redis
* Memcached
* Beanstalkd
* Laravel Envoy
* Blackfire Profiler
http://laravel.com/docs/5.0/homestead 

## Included Extras:
### Essentials:
* spf13: https://github.com/spf13/spf13-vim
* Solarized for Gnome :  https://github.com/Anthony25/gnome-terminal-colors-solarized
* TMUX: https://gist.github.com/diginc/8531848

### WebDev Specific  Tool:
* http-server: https://github.com/indexzero/http-server 
* SASS: http://sass-lang.com/install
* Compass: http://thesassway.com/beginner/getting-started-with-sass-and-compass
* css_parser: http://thesassway.com/beginner/getting-started-with-sass-and-compass
* SimpleHTTPServer: https://www.npmjs.com/package/simplehttpserver
 * Ruby: https://github.com/joshfng/railsready

# Getting Started:
### Run this: 
git clone https://github.com/joshmccall221/dotvagrant.git && cd ./dotvagrant && vagrant up && vargrant reload

#### Resources:
* https://atlas.hashicorp.com/
* http://askubuntu.com/questions/53822/how-do-you-run-ubuntu-server-with-a-gui
* http://www.devopsbookmarks.com/
* https://github.com/dotless-de/vagrant-vbguest
* http://docs.vagrantup.com/v2/virtualbox/boxes.html
* https://gist.github.com/fundon/1150782
* http://blog.csanchez.org/2012/05/03/automatically-download-and-install-virtualbox-guest-additions-in-vagrant/
* https://github.com/mitchellh/vagrant/issues/3341
#### zsh powerlines:
https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme

###Centos
* http://apetec.com/linux/InstallVIM.htm
* https://gist.github.com/fundon/1150782
