provisioner_modules="modules/"
provisioner_file="init.pp"

provisioner_install() {
  rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm && \
  yum -y install puppet
}

provisioner_run() {
  cd "${provision_dir}/provision"

  puppet apply --modulepath="${provisioner_modules}" "${provisioner_file}"
}
