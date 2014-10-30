#!/bin/sh
#
# Example script for updating a virtual appliance (doesn't actually do anything)
#
# Copyright (c) 2013-2014 Alex Williams, Unscramble. MIT License.
# http://unscramble.co.jp

echo "Updating the server.."

set -u
set -e

### Update Functions ###

trap 'exit 127' INT

echo 'All done!'

exit 0
