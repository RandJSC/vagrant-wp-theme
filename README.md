# Vagrant WordPress Theme Base

by Mike Green

## Setup

1. Clone and `cd` into this repo
2. Edit `Vagrantfile` and change `theme-name` to the name of your theme on line 40.
3. Run `vagrant up`. Let it download the base box and provision it.
4. Visit http://localhost:8888/ and setup WordPress. MySQL username is __root__, password is __root__, DB name is __wordpress_dev__
5. Build a WordPress theme inside the `theme` folder.

## About the Base Box

The base box for this setup is an opinionated Debian Squeeze 64bit Linux installation that comes with the following goodies:

* PHP-FPM v5.3.20-1~dotdeb.0
* Nginx v1.2.6
* MySQL v5.5.29-1~dotdeb.0
* Node.js v0.8.17
* RVM with Ruby 1.9.3p362 installed

We use Ruby for our Thor build scripts, and Node.js to compile CoffeeScripts.
