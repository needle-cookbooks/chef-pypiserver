Description
===========

This cookbook installs and configures pypiserver, a PyPI compatible package index.

Requirements
============

This cookbook depends on the following Opscode cookbooks:

* `git`
* `python`
* `runit`

Attributes
==========

* `version` - the version of pypiserver to install (defaults to 0.6.1)
* `root` - the base directory path for the pypiserver virtualenv and package storage
* `user` - the user to run pypiserver under
* `group` - the group to run pypiserver under
* `python_version` - the version of python interpreter to use for the virtualenv
* `address` - the ip address to bind to (defaults to 0.0.0.0)
* `port` - the port to bind to (defaults to 8080)
* `passwd_file` - the full path to apache-style htpasswd file for securing the pypiserver instance (defaults to nil)

Usage
=====

Include the default recipe in your node's run list, a pypiserver instance will be installed to `/opt/pypiserver` with the packages stored in `/opt/pypiserver/storage`. A Vagrantfile is included for your local testing pleasure.

If you want to password-protect your pypiserver instance, drop off an apache-style htpasswd file and use it's path to set the `passwd_file` attribute.