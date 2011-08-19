# node11

sudo wget https://raw.github.com/motech/GHANA-Config/master/puppet/puppet.repo -O /etc/yum.repos.d/puppet.repo
sudo rpm --import http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs
sudo yum -y upgrade

sudo yum install -y java-1.6.0-openjdk activemq
sudo /sbin/service activemq start

sudo yum install -y mcollective mcollective-client mcollective-common rubygem-stomp

# change stomp host and plugin.psk in /etc/mcollective/client.cfg and /etc/mcollective/server.cfg

sudo /sbin/service mcollective stop
sudo wget https://raw.github.com/motech/GHANA-Config/master/puppet/client.cfg -O /etc/mcollective/client.cfg
sudo wget https://raw.github.com/motech/GHANA-Config/master/puppet/server.cfg -O /etc/mcollective/server.cfg
sudo /sbin/service mcollective start

