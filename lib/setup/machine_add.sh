#!/bin/bash

echo "Puppetmaster is $1"

sudo rpm -Uvh http://yum.puppetlabs.com/base/puppetlabs-repo-3.0-2.noarch.rpm
sudo rpm -Uvh http://download.fedora.redhat.com/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm

sudo yum install -y ruby rubygems rubygem-stomp
sudo yum --enablerepo=epel-testing,tw_devops_custom install -y puppet

grep -w puppet /etc/hosts
if [ $? -ne 0 ] ; then
    echo "$1    puppet" >> /etc/hosts
else
    echo "puppet /etc/hosts entry already present"
fi

sudo /sbin/chkconfig puppet off
sudo /sbin/service puppet stop

sudo /usr/sbin/puppetd --waitforcert 30 --server puppet --verbose
