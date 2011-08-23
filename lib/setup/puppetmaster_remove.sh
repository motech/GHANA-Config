#!/bin/bash

sudo /sbin/service puppetmaster stop
sudo yum erase -y puppet-server
sudo rm -rf /var/lib/puppet /var/log/puppet /var/run/puppet /ssl /etc/puppet
