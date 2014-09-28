provisioner_pkgs=$(cat <<EOF
  python-yaml
  python-jinja2
  python-httplib2
  python-pip
  python-dev
  curl
  unzip
EOF
)

install_deps() {
  apt-get update && \
  apt-get install -y $provisioner_pkgs
}
