# Configurations
ram = 4096          #ram in mb

Vagrant.configure("2") do |config|
    config.vm.box = "generic/centos7"
    config.vm.hostname = "GitLab"
    
#    config.vm.network "public_network", bridge: "enp3s0", ip: "192.168.214.126", :netmask => "255.255.255.0"

    config.vm.provider "virtualbox" do |v|
      v.name = "GitLab"
      v.customize ["modifyvm", :id, "--memory", "#{ram}"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--usbehci", "off"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--groups", "/petshop"]
    end

   config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
   config.vm.provision "shell", privileged:false, inline: <<-SHELL
     bash /vagrant/dependencies.sh
   SHELL
end
