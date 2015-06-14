# -*- mode: ruby -*-
# vi: set ft=ruby :
# vi: set ts=2 sw=2 expandtabs :

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

  config.vm.provision :shell, path: "puppetinstall.sh"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "default.pp"
    puppet.module_path = ["puppet/modules"]
  end
  config.vm.provision :shell, path: "vagrantrunme.sh"
end
