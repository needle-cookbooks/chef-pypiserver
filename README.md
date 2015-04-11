Description
===========

This cookbook installs and configures [pypiserver](http://pypi.python.org/pypi/pypiserver), a PyPI compatible package index.

Requirements
============

This cookbook depends on the following Opscode cookbooks:

* [`git`](http://community.opscode.com/cookbooks/git)
* [`python`](http://community.opscode.com/cookbooks/python)
* [`runit`](http://community.opscode.com/cookbooks/runit)

Attributes
==========

* `version` - the version of pypiserver to install (defaults to 0.6.1)
* `storage` - the directory path where python modules should be stored (defaults to `/opt/pypi-server/packages`)
* `user` - the user to run pypiserver under (defaults to `root`)
* `group` - the group to run pypiserver under (defaults to `root`).
  Also this group has write-permissions on the storage. So they can  use `scp` to copy packages into this directory if they have a login on the server.
* `python_version` - the version of python interpreter to use for the virtualenv (defaults to `python2.7`)
* `virtualenv` - the directory path where a virtualenv for the pypiserver should be created (optional, defaults to `/opt/pypi-server/env`)
* `address` - the ip address to bind to (defaults to 0.0.0.0)
* `port` - the port to bind to (defaults to 8080)
* `passwd_file` - the full path to apache-style htpasswd file for securing the pypiserver instance (defaults to nil)
* `fallback_url` - the pypi server to query when this doesn't know about a package (defaults to 'https://pypi.python.org/simple').
  When set to `null` (js) aka `nil` (ruby), the pypiserver will not forward requests and serve local packages only.

Usage
=====

Include the default recipe in your node's run list, a pypiserver instance will be installed to a virtual environment at `/opt/pypi-server/env` serving packages from `/opt/pypi-server/storage`.  If you want to password-protect your pypiserver instance, drop off an apache-style htpasswd file and use it's path to set the `passwd_file` attribute.

A Vagrantfile is included for your local testing pleasure.