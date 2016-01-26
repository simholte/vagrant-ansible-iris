# -*- mode: ruby -*-
# # vi: set ft=ruby :

# Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Require YAML module
require 'yaml'

# Read YAML file with box details
servers = YAML.load_file('servers.yml')

# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

# Iterate through entries in YAML file
servers.each do |servers|
config.vm.define servers["name"] do |srv|
# installa nd run r10k
#srv.vm.provision :shell do |shell|
#    shell.path = "provision_for_puppet.sh"
#  shell.privileged = true

# forward ports from the guest to the host
  servers["ports"].each do |ports|
    srv.vm.network "forwarded_port",
    guest: ports["guest"], host: ports["host"]
  end
#set the hostname to be the name of the server
srv.vm.hostname = servers["name"]
srv.vm.box = servers["box"]
#make this a private network and assign it an IP address
srv.vm.network "private_network", ip: servers["ip"]
# set the name of the box, the cores and memory
srv.vm.provider :virtualbox do |vb|
vb.name = servers["name"]
vb.memory = servers["ram"]
vb.cpus = servers["cpus"]

# ansible
 srv.vm.provision :ansible do |ansible|
    ansible.playbook = "ansible/playbook.yml"
    ansible.verbose  = "v"

# puppet
 #srv.vm.provision :puppet do |puppet|
 ##    puppet.manifests_path = 'puppet/modules/roles/tests'
 #    puppet.module_path = ["puppet/modules","puppet/forgeModules/modules"]
 #    puppet.manifest_file = 'iris.pp'
 #  puppet.options="--verbose --debug"
 #  puppet.environment = "production"
#puppet.environment_path = ""
   #puppet.hiera_config_path = "configuration/etc/puppet/hiera.yaml"
#  puppet.working_directory = "/vagrant/environments"
#     puppet.environment = "production"
#  puppet.environment_path = "../../"
# end
end
end
end
end
end
