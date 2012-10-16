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

* `version`
* `root`
* `user`
* `group`
* `python_version`
* `address`
* `port`
* `passwd_file`

Usage
=====

Include the default recipe in your node's run list, a pypiserver instance will be installed to /opt/pypiserver with the packages stored in /opt/pypiserver/storage

