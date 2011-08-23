#!/bin/bash

sudo /sbin/service puppet stop
sudo yum erase -y puppet rubygem-stomp puppetlabs-repo

sudo sed 's/\(.*\)puppet//' /etc/hosts > /tmp/hosts
sudo mv /tmp/hosts /etc/hosts

