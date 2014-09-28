provision_command="./provision.sh"

provisioner_install() {
  true
}

provisioner_run() {
  $provision_command
}
