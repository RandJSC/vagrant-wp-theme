# Class: rubysetup::install

class rubysetup::install {
	$project_path = "/vagrant"
	$rvm_path     = "/home/vagrant/.rvm"
	$source_rvm   = "source ${rvm_path}/scripts/rvm"
	$as_vagrant   = "sudo -u vagrant -H bash -l -c"
	$bin_path     = "/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

	Exec {
		path => $bin_path,
	}

	exec {"install_gems":
		command => "${as_vagrant} '${source_rvm} && bundle install'",
		cwd     => $project_path,
		unless  => "${as_vagrant} '${source_rvm} && which thor'",
	}
}
