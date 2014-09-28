provisioner_json="solo.json"
provisioner_file="solo.rb"

provisioner_install() {
  (curl -L https://www.opscode.com/chef/install.sh | sh)
}

provisioner_run() {
  cd "${provision_dir}/provision"

  chef-solo -j "${provisioner_json}" -c "${provisioner_file}"
}
