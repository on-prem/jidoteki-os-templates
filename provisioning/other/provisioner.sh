provision_command="./provision.sh"

provisioner_install() {
  true
}

provisioner_run() {
  cd "${provision_dir}/provision"

  $provision_command
}
