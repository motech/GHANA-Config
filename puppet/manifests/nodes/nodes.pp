node base {
  package { 'htop': ensure => installed }
  include mcollective::agent
}

node default inherits base {
}

node 'sifynode36.thoughtworks.com' inherits base {
  include jenkins
}

node 'sifynode37.thoughtworks.com' inherits base {
}

node 'sifynode41.thoughtworks.com' inherits base {
}

node 'sifynode42.thoughtworks.com' inherits base {
  include puppetmaster
  include activemq
}

node 'sifynode43.thoughtworks.com' inherits base {
}

node 'sifynode44.thoughtworks.com' inherits base {
}
