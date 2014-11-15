# Jidoteki OS Templates ChangeLog

November 15, 2014 v0.4.4

  * Add FreeBSD 10.1 amd64 and i386

October 30, 2014 v0.4.3

  * Add Debian 7.7.0 amd64 and i386
  * Add CentOS 6.6 x86_64 and i386
  * Add Ubuntu 14.04.1 amd64 and i386

October 25, 2014, v0.4.2

  * Remove the CentOS hack to install epel-release

October 6, 2014, v0.4.1

  * Add default placeholder 'deps.sh' script which doesn't do anything

October 2, 2014, v0.4.0

  * Modified bootstrap scripts to be POSIX-compliant

September 25, 2014, v0.3.5

  * Removed Ubuntu 12.04.5 until we figure out the mirrors problem

September 24, 2014, v0.3.4

  * Rename FreeBSD 9.3 to FreeBSD 9.3-RELEASE
  * Add Ubuntu 12.04.5 amd64 and i386
  * Add Ubuntu 12.04.4 amd64 and i386

September 8, 2014, v0.3.3

  * Remove setup of admin directories from bootstrap scripts

August 30, 2014, v0.3.2

  * Fix Ansible provisioning

August 21, 2014, v0.3.1

  * Remove support for Ubuntu 14.04 temporarily

August 18, 2014, v0.3.0

  * Added working Puppet bootstrap script
  * Added working Shell bootstrap script

Augut 10, 2014 v0.2.28

  * Fixed sorting of FreeBSD in os_list.json

July 16, 2014 v0.2.27

  * Add FreeBSD 9.3 amd64, i386

July 15, 2014 v0.2.26

  * Add Debian 7.6.0 amd64 and i386

July 10, 2014 v0.2.25

  * Update Chef and Ansible bootstrap scripts to install on CentOS 7

July 9, 2014 v0.2.24

  * Add CentOS 7.0 x86_64

July 7, 2014 v0.2.23

  * Ubuntu 14.04 shouldn't use 'nomodeset' kernel option

July 7, 2014 v0.2.22

  * Ubuntu preseed uses a late_command to fix missing eth0 bug

July 5, 2014 v0.2.21

  * Modify Chef bootstrap script to use generic install method
  * Add OS_CPU variable in bootstrap scripts

July 3, 2014 v0.2.20

  * Add bootstrap script for Chef
  * Add OS_CPU variable in bootstrap scripts


July 2, 2014 v0.2.19

  * Add missing 'encrypt-home' install option in Ubuntu

July 1, 2014 v0.2.18

  * Ubuntu preseed scripts use 'ubuntu' as default user instead of root
  * Ubuntu installs have new kernel option 'nomodeset' to fix some minor issues
  * Update MIT License year
