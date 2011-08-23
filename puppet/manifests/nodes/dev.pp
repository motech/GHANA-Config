node 'sifynode42.thoughtworks.com' inherits base {
  # include puppetmaster
  include activemq
  include mcollective::client
}
