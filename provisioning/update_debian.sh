reprepro -b /opt/jidoteki/repos/apt/debian includedeb local *.deb
apt-get update -o Dir::Etc::sourcelist="local.list"
DEBIAN_FRONTEND=noninteractive apt-get upgrade --force-yes -y -o Dir::Etc::sourcelist="local.list"