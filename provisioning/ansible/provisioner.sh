provisioner_file="appliance.yml"
provisioner_version="1.6.10"

provisioner_install() {
  pip install ansible=="${provisioner_version}"
}

provisioner_run() {
  cd "${provision_dir}/provision"

  awk -F"\- hosts: " '/\- hosts: /{print $2}' "$provisioner_file" > \
    "${provision_dir}/appliance.inventory" && \
  export ANSIBLE_HOSTS="${provision_dir}/appliance.inventory" && \
  ansible-playbook "$provisioner_file" -c local
}

