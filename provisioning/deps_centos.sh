provisioner_pkgs=$(cat <<EOF
  python-yaml
  python-jinja2
  python-pip
  python-devel
  gcc
  make
  curl
EOF)

install_deps() {
  # Taken from: http://stackoverflow.com/a/14155303/297080
  cat <<EOF >/etc/yum.repos.d/epel-bootstrap.repo
[epelbootstrap]
name=Bootstrap EPEL
mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=epel-\$releasever&arch=\$basearch
failovermethod=priority
enabled=0
gpgcheck=1
EOF
  yum --enablerepo=epelbootstrap -y install epel-release && \
  yum --enablerepo=epel install -y "$provisioner_pkgs"
}
