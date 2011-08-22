#!/bin/bash

rpm -Uvh http://yum.puppetlabs.com/base/puppetlabs-repo-3.0-2.noarch.rpm
rpm -Uvh http://download.fedora.redhat.com/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm

yum install -y ruby rubygems git
yum --enablerepo=epel-testing,tw_devops_custom install -y puppet-server

collective="noop"
repo_location="/usr/share/puppet-recipes/$collective"

if [ -d $repo_location ] ; then
  rm -rf $repo_location
fi

mkdir -p $repo_location
git clone git://github.com/motech/GHANA-Config.git $repo_location/GHANA-Config

cat > /etc/puppet/puppet.conf <<EOF
[main]
    vardir = /var/lib/puppet
    logdir = /var/log/puppet
    rundir = /var/run/puppet
    ssldir = $vardir/ssl

[$collective]
    manifest = $repo_location/GHANA-Config/puppet/manifests/site.pp
    modulepath = $repo_location/GHANA-Config/puppet/modules
EOF

cat > /etc/puppet/fileserver.conf <<EOF
[modules]
  allow *
EOF

/sbin/service puppetmaster start
