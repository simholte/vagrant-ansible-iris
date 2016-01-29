# vagrant-ansible-iris

Ansible playbook to create the [MN DOT IRIS Server](http://iris.dot.state.mn.us/).  Clone the repo and type **vagrant up** to standup the instance.

You need to have [https://www.vagrantup.com](Vagrant) and [https://www.virtualbox.org/wiki/Downloads](Virtual Box) installed on your local machine.  

For Windows machine you can use my Chocolately script to install Vagrant and Virtual Box [​https://raw.githubusercontent.com/simholte/util-scripts/master/choco_vagrant_virtualbox.ps1](Chocolately Script)

For Mac OS assuing your using HomeBre and Cask you can use the below one liner
```shell
brew cask install virtualbox && brew cask install vagrant && brew cask install vagrant-manager
```

To open the IRIS Server's UI, open a web browser to `http://localhost:8080/iris-client`
