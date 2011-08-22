node base {
  include mcollective::agent
}

node default inherits base {
}

node 'sifynode42.thoughtworks.com' inherits base {
  include activemq
  include puppetmaster
}

node 'sifynode35.thoughtworks.com' inherits base {
  include jenkins
}

node 'sifynode36.thoughtworks.com' inherits base {
}
