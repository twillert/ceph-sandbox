#!/bin/bash -e

id
yum install -y epel-release
#yum-config-manager --enable epel-testing 
#yum install -y git ansible python2-boto python2-boto3 python2-botocore
#
# Botocore bug workaround
# current CentOS, python boto packages are buggy.
#
#yum install -y python2-pip
#pip install --upgrade pip
#pip install --upgrade botocore boto3
# END Botocore bug workaround

#curl -o /etc/ansible/ec2.py https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py
#chmod +x /etc/ansible/ec2.py
#curl -o /etc/ansible/ec2.ini https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini
#sed -i -e 's/^regions = all/regions = auto/' /etc/ansible/ec2.ini

test -d .ssh || mkdir -m 0700 .ssh
cp /vagrant/config /vagrant/thomas* .ssh/
chown vagrant:vagrant .ssh/thomas*
chmod 0600 .ssh/thomas*

cat > ~vagrant/bootstrap-git.sh <<EOF
mkdir git
cd git
git clone git@github.com:twillert/ceph-sandbox.git
cd ceph-sandbox
git config --global user.name "Thomas Willert"
git config --global user.email thomas@willert.dk
git config --global push.default simple
EOF
chmod +x ~vagrant/bootstrap-git.sh

cat /vagrant/dot.bashrc >> ~vagrant/.bashrc



