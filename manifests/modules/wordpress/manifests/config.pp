# Class: wordpress::config
#
# Creates /home/vagrant/www/wp-config.php

class wordpress::config {
	$install_path = "/home/vagrant/www"

	file {"$install_path/wp-config.php":
		ensure  => present,
		owner   => "vagrant",
		group   => "vagrant",
		mode    => 0644,
		source  => "/tmp/vagrant-puppet/manifests/modules/wordpress/files/wp-config.php",
		require => Class["wordpress::install"]
	}

}
