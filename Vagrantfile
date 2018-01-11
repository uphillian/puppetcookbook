# -*- mode: ruby -*-
# vi: set ft=ruby :

$rhel = <<EOF
yum install -y http://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
yum install -y puppet-agent
EOF
$debian = <<EOF
apt-get install -y https://apt.puppet.com/puppet5-release-stretch.deb
apt-get install -y puppet-agent
EOF
Vagrant.configure("2") do |config|
  config.vm.define "centos" do |centos|
    centos.vm.box = "centos/7"
    centos.vm.provision "shell", inline: $rhel
    centos.vm.hostname = "cookbook.example.com"
  end

  config.vm.define "debian" do |debian|
    debian.vm.box = "debian/stretch64"
    debian.vm.provision "shell", inline: $debian
    debian.vm.hostname = "cookbook.example.com"
  end
end
