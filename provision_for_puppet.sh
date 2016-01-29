#!/bin/sh

#install git
rpm -q git &> /dev/null || yum install -q -y git
#install rubygems
rpm -q rubygems &> /dev/null || yum install -q -y rubygems
gem query --name r10k --installed &> /dev/null || gem install --no-rdoc --no-ri r10k -v 1.5.1
#trying to configure r10k to put puppet modules in the /etc/puppet/modules directory but it's not working
#cp /vagrant/puppet/configuration/etc/r10k.yaml /etc
#sudo mkdir -p /etc/puppet/environments/production/hiera
#sudo ln -s /vagrant/hiera/* /etc/puppet/environments/production/hiera/
#run r10k from our puppet directory, must have a PuppetFile at the root of the /vagrant/puppet directory for it to pull any modules down
#cp /vagrant/configuration/etc/puppet/Puppetfile /vagrant/forgemodules/Puppetfile
cd /vagrant/puppet/forgemodules && r10k -v info puppetfile install
