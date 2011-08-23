node ci inherits base {
  $collective = "ci"
}

node 'sifynode37.thoughtworks.com' inherits ci {
  include git
  include jenkins
}
