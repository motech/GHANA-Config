node base {
  package { 'htop': ensure => installed }
  include mcollective::agent
  $collective = "dev"
}

node default inherits base {
}

node 'sifynode42.thoughtworks.com' inherits base {
  # include puppetmaster
  include activemq
}
