sudo wget https://raw.github.com/motech/GHANA-Config/master/puppet/setup/puppetlabs.repo -O /etc/yum.repos.d/puppetlabs.repo

sudo yum install -y java-1.6.0-openjdk
sudo rpm -Uvh http://downloads.puppetlabs.com/mcollective/tanukiwrapper-3.2.3-1jpp.x86_64.rpm
sudo yum install -y  activemq
sudo /sbin/service activemq restart

sudo yum install -y mcollective mcollective-client mcollective-common rubygem-stomp

# change stomp host and plugin.psk in /etc/mcollective/client.cfg and /etc/mcollective/server.cfg
sudo wget https://raw.github.com/motech/GHANA-Config/master/puppet/setup/client.cfg -O /etc/mcollective/client.cfg
sudo wget https://raw.github.com/motech/GHANA-Config/master/puppet/setup/server.cfg -O /etc/mcollective/server.cfg
sudo /sbin/service mcollective restart
