# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "laravel/homestead"
  config.vm.synced_folder "../", "/vagrant_data"
  config.vm.synced_folder "../dotvagrant/", "/dotvagrant"
  config.vm.synced_folder "~", "/user_home"
  #
   config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
     vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
     vb.memory = "5025"
   end

  config.vm.provision "shell", path: "vagrantrunme.sh"
end
