#!/bin/bash

sudo rpm -Uvh http://yum.puppetlabs.com/base/puppetlabs-repo-3.0-2.noarch.rpm
sudo rpm -Uvh http://download.fedora.redhat.com/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm

sudo yum install -y ruby rubygems rubygem-stomp
sudo yum --enablerepo=epel-testing install -y puppet

sudo /sbin/chkconfig puppet off
sudo /sbin/service puppet stop

sudo /usr/sbin/puppetd --waitforcert 30 --server puppet --verbose
