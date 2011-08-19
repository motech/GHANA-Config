node 'sifynode11.thoughtworks.com' {
  include activemq
  include mcollective::config
}

node base {
  include mcollective::config
}

node 'sifynode35.thoughtworks.com' inherits base {
}

node 'sifynode36.thoughtworks.com' inherits base {
}

node default inherits base {
}
