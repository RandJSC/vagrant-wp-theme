#= Main Puppet Manifest

# Update Apt Repo
exec {"update-apt":
	command => "apt-get update",
	cwd     => "/",
	path    => ["/usr/bin", "/usr/local/bin", "/bin", "/usr/local/sbin", "/usr/sbin", "/sbin"],
}

# Install cURL
package {"curl":
	ensure => present,
	require => Exec["update-apt"],
}

# Install MySQL Client Libraries
package {"libmysqlclient-dev":
	ensure => present,
	require => Exec["update-apt"],
}

# Download WordPress
exec {"download_wordpress":
	command => "wget http://wordpress.org/latest.tar.gz",
	cwd     => "/tmp",
	creates => "/tmp/latest.tar.gz",
	path    => ["/usr/bin", "/bin", "/usr/local/bin"],
	unless  => "test -f /home/vagrant/www/index.php",
}

# Extract WordPress
exec {"extract_wordpress":
	command => "tar xzf /tmp/latest.tar.gz",
	cwd     => "/tmp",
	creates => "/tmp/wordpress",
	path    => ["/usr/bin", "/usr/local/bin", "/bin"],
	require => Exec["download_wordpress"],
	unless  => "test -f /home/vagrant/www/index.php",
}

# Install WordPress
exec {"install_wordpress":
	command => "cp -r /tmp/wordpress/* /home/vagrant/www/",
	cwd     => "/tmp",
	path    => ["/usr/bin", "/usr/local/bin", "/bin", "/usr/local/sbin", "/usr/sbin", "/sbin"],
	require => Exec["extract_wordpress"],
	unless  => "test -f /home/vagrant/www/index.php",
}

exec {"chmod_wordpress":
	command => "chown -R vagrant:vagrant /home/vagrant/www",
	cwd     => "/home/vagrant",
	path    => ["/usr/bin", "/usr/local/bin", "/bin", "/usr/local/sbin", "/usr/sbin", "/sbin"],
	unless  => "ls -l /home/vagrant/www | grep vagrant",
	require => Exec["install_wordpress"],
}

# Setup MySQL database
exec {"setup_mysql":
	command => "echo 'create database wordpress_dev;' | mysql --user=root --password=root",
	path    => ["/usr/bin", "/usr/local/bin", "/bin", "/usr/local/sbin", "/usr/sbin", "/sbin"],
	unless  => "echo 'show databases' | mysql --user=root --password=k2130k | grep wordpress_dev",
}

