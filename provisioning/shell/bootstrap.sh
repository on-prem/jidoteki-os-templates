#!/bin/bash
#
# Bootstrap script for provisioning a virtual appliance
#
# Copyright (c) 2013-2014 Alex Williams, Unscramble. MIT License.
# http://unscramble.co.jp

PROVISION_DIR="/tmp/provisioning"
OS_NAME="default"
OS_CPU="default"
PROVISIONER_FILE="provision.sh"

provision_failed() {
  echo -e "\e[31m[ENTERPRISE APPLIANCE] Provisioning failed. Cleaning up..\e[0m"
  cleanup
  exit 1
}

# Jidoteki makes it easy to manage update packages for your customers.
# The updates.key file will be used to decrypt the update packages.
manage_updates() {
  cd $PROVISION_DIR

  if [ -f "updates.key" ]; then
    mkdir -p /opt/admin/bin && \
    mkdir -p /opt/admin/etc && \
    mkdir -p /opt/admin/tmp && \
    mkdir -p /opt/admin/log && \
    chmod -R 750 /opt/admin && \
    mv updates.key /opt/admin/etc/ && \
    chmod 600 /opt/admin/etc/updates.key || provision_failed
  fi
}

extract_provision_package() {
  cd $PROVISION_DIR

  mkdir -p provision
  umask 027
  echo "Extract command goes here" || provision_failed
}

provisioner_run() {
  cd ${PROVISION_DIR}/provision

  ./provision.sh || provision_failed
}

cleanup() {
  cd /tmp

  rm -rf $PROVISION_DIR
}

# Run all the tasks
manage_updates
extract_provision_package
provisioner_run
cleanup

echo -e "\e[34m[ENTERPRISE APPLIANCE] Provisioning successful\e[0m"
exit 0
