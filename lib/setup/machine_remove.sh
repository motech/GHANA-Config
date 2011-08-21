#!/bin/bash

sudo /sbin/service puppet stop
sudo yum --enablerepo=epel-testing erase -y puppet
sudo yum erase -y ruby rubygems rubygem-stomp
