#!/bin/bash

sudo /sbin/service puppet stop
sudo yum erase -y puppet
sudo yum erase -y rubygem-stomp
