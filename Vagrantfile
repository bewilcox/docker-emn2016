# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = {
  "host0" => "192.168.33.10",
  "host1" => "192.168.33.11",
  "host2" => "192.168.33.12"
}

Vagrant.configure("2") do |config|


  hosts.each do |name, ip|
    config.vm.define name do |machine|
      machine.vm.box = "precise64"
      machine.vm.box_url = "http://files.vagrantup.com/precise64.box"
      machine.vm.hostname = name
      machine.vm.network :private_network, ip: ip
      machine.vm.provider "virtualbox" do |v|
          v.customize ["modifyvm", :id, "--memory", 200]
      end
      # Needed dependencies to use the Ansible Docker module
      machine.vm.provision :shell, :inline => "sudo apt-get install -y curl; curl -s https://get.docker.io/ubuntu/ | sudo sh"
      machine.vm.provision :shell, :inline => "sudo apt-get install -y python-pip"
      machine.vm.provision :shell, :inline => "sudo pip install docker-py"
    end
  end

  config.vm.define "ansible" do |a|
    a.vm.box = "precise64"
    a.vm.hostname = "ansible"
    a.vm.box_url = "http://files.vagrantup.com/precise64.box"
    a.vm.network :private_network, ip: "192.168.29.100"
    a.vm.provision :shell, :inline => "sudo apt-get update"
    a.vm.provision :shell, :inline => "sudo apt-get install -y git python-yaml python-jinja2 python-paramiko python-crypto"
    a.vm.provision :shell, :inline => "sudo apt-get install -y software-properties-common python-software-properties"
    a.vm.provision :shell, :inline => "sudo apt-add-repository ppa:ansible/ansible"
    a.vm.provision :shell, :inline => "sudo apt-get update"
    a.vm.provision :shell, :inline => "sudo apt-get install -y ansible"
    a.vm.provision :shell, :inline => "sudo apt-get install -y curl; curl -s https://get.docker.io/ubuntu/ | sudo sh"
    a.vm.provision :shell, :inline => "git clone https://github.com/csi-projects/demo-ansible-docker.git"
  end

end
