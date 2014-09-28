#!/bin/sh
#
# Bootstrap script for provisioning a virtual appliance
#
# Copyright (c) 2013-2014 Alex Williams, Unscramble. MIT License.
# http://unscramble.co.jp

set -u
set -e

export provision_dir="/tmp/provisioning"

### Bootstrap Functions ###
provision_failed() {
  >&2 echo "[VIRTUAL APPLIANCE] Provisioning failed. Cleaning up.."
  exit 1
}

cleanup() {
  rm -rf "${provision_dir}"
}

trap cleanup EXIT
trap 'exit 127' INT

# Run all the tasks
extract_package     && \
install_deps        && \
provisioner_install && \
provisioner_run     || provision_failed

echo "[VIRTUAL APPLIANCE] Provisioning successful"
exit 0