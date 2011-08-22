#!/bin/bash

sudo /sbin/service puppet stop
sudo yum erase -y puppet
sudo yum erase -y rubygem-stomp

sudo sed 's/\(.*\)puppet//' /etc/hosts > /tmp/hosts
sudo mv /tmp/hosts /etc/hosts
