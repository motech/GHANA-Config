#!/bin/bash

rpm -Uvh http://yum.puppetlabs.com/base/puppetlabs-repo-3.0-2.noarch.rpm
rpm -Uvh http://download.fedora.redhat.com/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm

yum install -y ruby rubygems
yum --enablerepo=epel-testing,tw_devops_custom install -y puppet-server
/sbin/service puppetmaster start
