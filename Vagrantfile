# This Vagrantfile creates to VMs app01 and db01
# Redis is installed on db01


# Set the modeline to ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/stretch64"

   config.vm.define "db01" do |db01|
     db01.vm.hostname = "db01"
     db01.vm.network "private_network", ip: "192.168.56.10"
     db01.vm.provision "shell", path: "scripts/install_redis.sh"
   end

  config.vm.define "app01" do |app01|
     app01.vm.hostname = "app01"
     app01.vm.network "private_network", ip: "192.168.56.20"
     app01.vm.provision "shell", path: "scripts/install_JDK.sh"
  end

end