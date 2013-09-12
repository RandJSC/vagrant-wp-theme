# Class: wordpress
#
# This class installs and configures WordPress
#
# Actions:
# 	- Download WordPress
# 	- Extract it to the public web folder
# 	- Load a basic configuration file
#
# Usage:
# 	include wordpress

class wordpress {
	include wordpress::install, wordpress::config
}

# vim: set ts=4 sw=4 noexpandtab :
