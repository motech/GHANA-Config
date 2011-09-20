node dev inherits base {
  $_collective = "dev"
  include global
}

node 'sifynode42.thoughtworks.com' inherits dev {
  # include puppetmaster
  include activemq
  include mcollective::client
}
