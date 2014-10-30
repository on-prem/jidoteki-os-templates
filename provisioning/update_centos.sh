mv *.rpm /opt/jidoteki/repos/yum/centos/RPMS/
createrepo /opt/jidoteki/repos/yum/centos
yum update -y --enablerepo=local