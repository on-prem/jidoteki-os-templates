#!/bin/bash
#
# Bootstrap script for provisioning a virtual appliance
#
# Copyright (c) 2013-2014 Alex Williams, Unscramble. MIT License.
# http://unscramble.co.jp

PROVISION_DIR="/tmp/provisioning"
OS_NAME="default"

provision_failed() {
  echo -e "\e[31m[ENTERPRISE APPLIANCE] Provisioning failed. Cleaning up..\e[0m"
  cleanup
  exit 1
}

PROVISIONER_VERSION="1.5.4"

manage_updates() {
  cd $PROVISION_DIR

  if [ -f "updates.key" ]; then
    mkdir -p /opt/admin/{bin,etc,tmp,log} && \
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
    *)
      provision_failed
      ;;
  esac
}

provisioner_centos() {
  rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm && \
  yum install -y python-jinja2 python-yaml make && \
  rpm -e epel-release-6-8.noarch || provision_failed
}

provisioner_debian() {
  apt-get update && \
  apt-get install -y python-yaml python-jinja2 python-httplib2 curl unzip || provision_failed
}

provisioner_freebsd() {
  pkg_add -r python27 bash py27-pip libyaml -F && \
  ln -sf /usr/local/bin/python /usr/bin/python && \
  pip install --use-mirrors PyYAML Jinja2 || provision_failed
}

provisioner_ubuntu() {
  # Same as Debian
  provisioner_debian
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
manage_updates
provisioner_deps
provisioner_install
provisioner_setup
extract_provision_package
provisioner_run
cleanup

echo -e "\e[34m[ENTERPRISE APPLIANCE] Provisioning successful\e[0m"
exit 0
