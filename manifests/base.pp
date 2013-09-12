#= Main Puppet Manifest

# Install and configure WordPress
include wordpress

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

# Setup MySQL database
exec {"setup_mysql":
	command => "echo 'create database wordpress_dev;' | mysql --user=root --password=root",
	path    => ["/usr/bin", "/usr/local/bin", "/bin", "/usr/local/sbin", "/usr/sbin", "/sbin"],
	unless  => "echo 'show databases' | mysql --user=root --password=root | grep wordpress_dev",
}

