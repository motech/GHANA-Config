node base {
  package { 'htop': ensure => installed }
  include mcollective::agent
}

node default inherits base {
  $collective = "dev"
}

node 'sifynode42.thoughtworks.com' inherits base {
  include puppetmaster
  include activemq
}
