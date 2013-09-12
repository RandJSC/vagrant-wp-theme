# Class: wordpress::install
#
# Contains installation actions for WordPress on Vagrant

class wordpress::install {
	$install_path = "/home/vagrant/www"
	$bin_path = "/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

	Exec {
		path => $bin_path
	}

	exec {"download_wordpress":
		command => "wget http://wordpress.org/latest.tar.gz",
		cwd     => "/tmp",
		creates => "/tmp/latest.tar.gz",
		unless  => "test -f $install_path/index.php",
	}

	exec {"extract_wordpress":
		command => "tar xzf /tmp/latest.tar.gz",
		cwd     => "/tmp",
		creates => "/tmp/wordpress",
		require => Exec["download_wordpress"],
		unless  => "test -f $install_path/index.php",
	}

	exec {"install_wordpress":
		command => "cp -r /tmp/wordpress/* $install_path/",
		cwd     => "/tmp",
		creates => "$install_path/index.php",
		require => Exec["extract_wordpress"],
		unless  => "test -f $install_path/index.php",
	}

	exec {"chmod_wordpress":
		command => "chown -R vagrant:vagrant $install_path",
		cwd     => "/home/vagrant",
		unless  => "ls -l $install_path | grep vagrant",
		require => Exec["install_wordpress"],
	}
}
