# Vagrant WordPress Theme Base

by Mike Green

## Setup

1. Clone and `cd` into this repo
2. Edit `Vagrantfile` and change `theme-name` to the name of your theme on line 29.
3. Run `vagrant up`. Let it download the base box and provision it.
4. Visit http://localhost:8888/ and setup WordPress. MySQL username is __root__, password is __root__, DB name is __wordpress_dev__
5. Build a WordPress theme inside the `theme` folder.

## About the Base Box

The base box for this setup is an opinionated Debian Wheezy 64bit Linux installation that comes with the following goodies:

* PHP-FPM v5.4.17-1~dotdeb.1
* Nginx v1.4.2-1~dotdeb.1
* MySQL v5.5.31+dfsg-0+wheezy1
* Node.js v0.10.13
* RVM with Ruby 2.0.0-p247 installed

We use Ruby for our Thor build scripts, and Node.js to compile CoffeeScripts.
