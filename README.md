jidoteki-os-templates
=====================

Official Jidoteki OS templates

# WARNING: DEPRECATED

Since [Jidoteki](https://jidoteki.com) now supports [Custom OS installations](http://blog.unscramble.co.jp/post/99370686563/importing-veewee-and-packer-configs) (a.k.a. almost any OS), we've decided to stop supporting specific systems. These templates will remain accessible as examples, but won't receive any updates.

# Templates

OS templates are located in the `os_list` directory.

# Available Operating Systems

## Debian

* Debian 7.7.0 [amd64,i386]
* Debian 7.6.0 [amd64,i386]
* Debian 7.5.0 [amd64,i386]
* Debian 7.4.0 [amd64,i386]
* Debian 7.3.0 [amd64,i386]
* Debian 7.2.0 [amd64,i386]
* Debian 7.1.0 [amd64,i386]
* Debian 7.0.0 [amd64,i386]

## FreeBSD

* FreeBSD 10.0 [amd64,i386]
* FreeBSD 9.3 [amd64,i386]
* FreeBSD 9.2 [amd64,i386]
* FreeBSD 9.1 [amd64,i386]

## CentOS

* CentOS 7.0 [x86_64]
* CentOS 6.6 [x86_64,i386]
* CentOS 6.5 [x86_64,i386]
* CentOS 6.4 [x86_64,i386]

## Ubuntu

* Ubuntu 14.04.1 [amd64,i386]
* Ubuntu 12.04.4 [amd64,i386]
* Ubuntu 12.04.3 [amd64,i386]

# Provisioning

Provisioning and bootstrap scripts are located in the `provisioning` directory.

## Vagrant

* Create Vagrant .box files using Ansible

# License

MIT License, see the [LICENSE](https://github.com/unscramble/jidoteki-os-templates/blob/master/LICENSE) file.
