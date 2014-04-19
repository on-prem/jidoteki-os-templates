#!/bin/bash
#
# Bootstrap script for provisioning a virtual appliance
#
# Copyright (c) 2013-2014 Alex Williams, Unscramble. MIT License.
# http://unscramble.co.jp

PROVISION_DIR="/tmp/provisioning"

provision_failed() {
  echo -e "\e[31m[ENTERPRISE APPLIANCE] Provisioning failed. Cleaning up..\e[0m"
  cleanup
  exit 1
}

PROVISIONER_VERSION="1.5.4"

provisioner_deps() {
  apt-get update && \
  apt-get install -y python-yaml python-jinja2 python-httplib2 curl unzip || provision_failed
}

provisioner_install() {
  cd $PROVISION_DIR

  curl -s -S -f -L --retry 3 -o ansible-v${PROVISIONER_VERSION}.tar.gz https://github.com/ansible/ansible/archive/v${PROVISIONER_VERSION}.tar.gz || provision_failed
  tar -zxf ansible-v${PROVISIONER_VERSION}.tar.gz -C /opt || provision_failed
  rm -f /opt/ansible && ln -s /opt/ansible-${PROVISIONER_VERSION} /opt/ansible || provision_failed
}

provisioner_setup() {
  cd /opt/ansible

  source hacking/env-setup -q || provision_failed
}

extract_provision_package() {
  cd $PROVISION_DIR

  mkdir -p provision
  umask 027
  echo "Extract command goes here" || provision_failed
}

provisioner_run() {
  cd ${PROVISION_DIR}/provision/ansible

  ansible-playbook appliance.yml -i enterprise.inventory -c local || provision_failed
}

cleanup() {
  cd /tmp

  rm -rf $PROVISION_DIR
}

# Run all the tasks
provisioner_deps
provisioner_install
provisioner_setup
extract_provision_package
provisioner_run
cleanup

echo -e "\e[34m[ENTERPRISE APPLIANCE] Provisioning successful\e[0m"
exit 0
