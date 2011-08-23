node dev inherits base {
  $collective = "dev"
}

node 'sifynode42.thoughtworks.com' inherits dev {
  # include puppetmaster
  include activemq
  include mcollective::client
}
