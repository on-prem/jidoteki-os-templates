extract_command="extract command goes here"

extract_package() {
  cd "$provision_dir"

  mkdir -p provision
  umask 027
  $(${extract_command})
}

