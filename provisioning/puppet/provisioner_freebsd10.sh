provisioner_modules="modules/"
provisioner_file="init.pp"

provisioner_install() {
  pkg install -y puppet
}

provisioner_run() {
  cd "${provision_dir}/provision"

  puppet apply --modulepath="${provisioner_modules}" "${provisioner_file}" || provision_failed
}
