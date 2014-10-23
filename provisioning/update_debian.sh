#!/bin/sh
#
# Example script for updating a virtual appliance (only updates OS packages)
#
# Copyright (c) 2013-2014 Alex Williams, Unscramble. MIT License.
# http://unscramble.co.jp
#
# DEBIAN / UBUNTU

echo "Installing latest packages.."

for i in `ls -1 *.deb`; do dpkg -i $i ; done

echo 'All done!'

exit 0
