node ci inherits base {
  $collective = "ci"
}

node 'sifynode41.thoughtworks.com' inherits ci {
  include git
  include jenkins
}
