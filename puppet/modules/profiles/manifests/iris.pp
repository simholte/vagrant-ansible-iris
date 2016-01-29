# Class: profiles::iris
#
# A profile for the iris
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class profiles::iris(
  $rpm_name = 'iris-4.30.0-1.noarch.rpm',
	)  {
  
    group { 'iris':
  	  ensure => 'present',
    }

    user { 'iris':
 	  ensure           => 'present',
      groups              => 'iris',
      home             => '/home/iris',
     }




	exec {'download the rpm' :
      command  => "wget -P /tmp http://iris.dot.state.mn.us/rpms/${rpm_name}",
#      notify   => Exec['install the iris RPM'],
      path      => '/usr/bin',
      creates   => "/tmp/${rpm_name}",
      #onlyif   => ''
	}

   package { 'iris':
      provider => 'rpm' ,
      ensure => 'installed' ,
      source => "/tmp/${rpm_name}",
      require => Exec['download the rpm'],
    }
    # install the RPM
 #   exec{'install the iris RPM' :
  #    command   =>"rpm -ivh /tmp/${rpm_name}",
    #  subscribe => File["/tmp/${rpm_name}"],
   #   notify    => Exec['initialize iris'],
   #   path      => '/usr/bin',
   # }
    # run the init script
    exec{'initialize iris' :
      command     => 'iris_ctl init',
      refreshonly => true,
      path        => '/usr/bin',
      require     => Package['iris'],
    }  




}