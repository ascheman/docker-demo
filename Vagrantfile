# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

  config.vm.provider "parallels" do |v, override|
    override.vm.box = "parallels/ubuntu-14.04"
    v.memory = 1024
    # Docker
    v.network "forwarded_port", guest: 2375, host: 32375
    # Docker Registry
    v.network "forwarded_port", guest: 5000, host: 35000
    # Docker Registry UI
    v.network "forwarded_port", guest: 8080, host: 38080
  end

  config.vm.provision "shell", path: "puppet/init-puppet-debian.sh"

  config.vm.provision "puppet" do |debian|
    debian.manifests_path = "puppet/manifests"
    debian.manifest_file = "debian.pp"
  end

  config.vm.provision "puppet" do |docker|
    docker.manifests_path = "puppet/manifests"
    docker.manifest_file = "docker-base.pp"
  end

end
