provisioner_pkgs=$(cat <<EOF
  python27
  py27-pip
  libyaml
  gmake
  unzip
  curl
EOF
)

install_deps() {
  cd /usr/ports/ports-mgmt/pkg
  make -DBATCH install
  pkg2ng
  pkg install -y $provisioner_pkgs && \
  ln -sf /usr/local/bin/python /usr/bin/python && \
  pip install --use-mirrors PyYAML Jinja2
}
