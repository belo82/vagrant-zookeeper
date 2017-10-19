# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "zookeeper-vagrant-01"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.

  # zk client port
  config.vm.network "forwarded_port", guest: 2181, host: 2181

  # zk follower port
  config.vm.network "forwarded_port", guest: 2181, host: 2181

  # zk leader election port
  config.vm.network "forwarded_port", guest: 2181, host: 2181

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "private_network", type: "dhcp"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  config.vm.define "zookeeper-vagrant-01"

  config.vm.provision "shell", path: "basic-setup.sh"

end
