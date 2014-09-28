provisioner_modules="modules/"
provisioner_file="init.pp"
provisioner_package="puppetlabs-release-precise.deb"

provisioner_install() {
  cd /tmp

  curl -o "${provisioner_package}" "https://apt.puppetlabs.com/${provisioner_package}" && \
  dpkg -i "${provisioner_package}" && \
  apt-get update && \
  apt-get install -y puppet
}

provisioner_run() {
  cd "${provision_dir}/provision"

  puppet apply --modulepath="${provisioner_modules}" "${provisioner_file}"
}
