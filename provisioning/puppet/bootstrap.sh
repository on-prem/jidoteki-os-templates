#!/bin/bash
#
# Bootstrap script for provisioning a virtual appliance
#
# Copyright (c) 2013-2014 Alex Williams, Unscramble. MIT License.
# http://unscramble.co.jp

PROVISION_DIR="/tmp/provisioning"
OS_NAME="default"
OS_CPU="default"
PROVISIONER_FILE="init.pp"

provision_failed() {
  echo -e "\e[31m[ENTERPRISE APPLIANCE] Provisioning failed. Cleaning up..\e[0m"
  cleanup
  exit 1
}

PROVISIONER_VERSION="11.10.4-1"

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

provisioner_deps() {
  case "${OS_NAME}" in
    "centos")
      provisioner_centos
      ;;
    "debian")
      provisioner_debian
      ;;
    "freebsd")
      provisioner_freebsd
      ;;
    "ubuntu")
      provisioner_ubuntu
      ;;
    *)
      provision_failed
      ;;
  esac
}

provisioner_centos() {
  # Taken from: http://stackoverflow.com/a/14155303/297080
  cat <<EOF >/etc/yum.repos.d/epel-bootstrap.repo
[epelbootstrap]
name=Bootstrap EPEL
mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-\$releasever&arch=\$basearch
failovermethod=priority
enabled=0
gpgcheck=0
EOF
  yum --enablerepo=epelbootstrap -y install epel-release && \
  yum --enablerepo=epel install -y make curl puppet && \
  rm -f /etc/yum.repos.d/epel-bootstrap.repo || provision_failed
}

provisioner_debian() {
  apt-get update && \
  apt-get install -y curl unzip bash puppet || provision_failed
}

provisioner_freebsd() {
  pkg_add -r gmake -F && \
  pkg_add -r bash -F && \
  pkg_add -r curl -F && \
  pkg_add -r puppet -F || provision_failed
}

provisioner_ubuntu() {
  apt-get update && \
  apt-get install -y curl unzip bash puppet || provision_failed
}

extract_provision_package() {
  cd $PROVISION_DIR

  mkdir -p provision
  umask 027
  echo "Extract command goes here" || provision_failed
}

provisioner_run() {
  cd ${PROVISION_DIR}/provision

  puppet apply --modulepath=modules/ ${PROVISIONER_FILE} || fail_and_exit || provision_failed
}

cleanup() {
  cd /tmp

  rm -rf $PROVISION_DIR
}

# Run all the tasks
manage_updates
provisioner_deps
extract_provision_package
provisioner_run
cleanup

echo -e "\e[34m[ENTERPRISE APPLIANCE] Provisioning successful\e[0m"
exit 0
