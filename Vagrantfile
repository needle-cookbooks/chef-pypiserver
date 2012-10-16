# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'vagrant/provisioners/chef'
require 'chef'

#
# Before running vagrant, export the shell variable for the organization on Hosted Chef and
# make sure the validator certificate is in ~/.chef.
#
# export ORGNAME=your_platform_organization
#
# You can optionally export a shell variable for your Chef server username if it is different
# from your OS user export OPSCODE_USER=bofh
box_name = ENV['VAGRANT_BOX'] || 'opscode-ubuntu-12.04'
box_url = ENV['VAGRANT_BOX_URL'] || 'https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-ubuntu-12.04.box'

Vagrant::Config.run do |config|

  config.vm.box = box_name
  config.vm.box_url = box_url
  config.vm.customize [ "modifyvm", :id, "--memory", 512]
  config.vm.customize [ "modifyvm", :id, "--cpus", 1 ]
  config.vm.host_name = "pypiserver.local"
  config.vm.network :bridged, '33.33.33.10'

  config.vm.provision :chef_solo do |chef|
    chef.provisioning_path = "/etc/vagrant-chef"
    chef.cookbooks_path = [ "/tmp/pypiserver-cookbooks" ]
    chef.log_level = :debug

    chef.run_list = [
      "recipe[pypiserver]"
    ]

    chef.json = { }
  end
end
