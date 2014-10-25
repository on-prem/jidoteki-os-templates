provisioner_pkgs=$(cat <<EOF
  python-yaml
  python-jinja2
  python-pip
  python-devel
  gcc
  make
  curl
EOF
)

install_deps() {
  yum install -y epel-release
  yum --enablerepo=epel install -y $provisioner_pkgs
}
