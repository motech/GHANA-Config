node base {
  include mcollective::config
}

node default inherits base {
}

node 'sifynode11.thoughtworks.com' {
  include activemq
  include mcollective::config
  include puppetmaster
}

node 'sifynode35.thoughtworks.com' inherits base {
  include jenkins
}

node 'sifynode36.thoughtworks.com' inherits base {
}

