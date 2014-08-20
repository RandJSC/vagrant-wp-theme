# Vagrant WordPress Theme Base

by Mike Green

## Setup

1. Install Ansible if you don't already have it. You'll need it to provision the box. https://github.com/ansible/ansible
1. Clone and `cd` into this repo
1. Edit `Vagrantfile` and change `THEME_NAME` to the name of your theme on line 26.
1. Run `vagrant up`. Let it download the base box and provision it.
1. Visit http://localhost:8888/ and setup WordPress. MySQL username is __root__, password is __root__, DB name is __wordpress_dev__
1. Build a WordPress theme inside the `build` folder.

## About the Base Box

The base box for this setup is an opinionated Debian Wheezy 64bit Linux installation that comes with the following goodies:

* Nginx v1.6.1 from dotdeb.org
* PHP v5.4.30 from dotdeb.org
* Ruby v2.1.2
* Node v0.10.29

I update the box around once a month, updating packages and installing whatever new stuff I need for projects. The box is
available separately from this repo on Vagrant Cloud: https://vagrantcloud.com/mikedamage/wheezy64-wordpress-base
