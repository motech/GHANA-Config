node ci inherits base {
  $collective = "ci"
  include mcollective::agent
}

node 'sifynode41.thoughtworks.com' inherits ci {
  include git
  include jenkins
  include maven
  include couchdb
}
