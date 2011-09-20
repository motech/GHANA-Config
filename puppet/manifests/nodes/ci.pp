node ci inherits base {
  $_collective = "ci"
  include global
}

node 'sifynode41.thoughtworks.com' inherits ci {
  include git
  include jenkins
  include maven
  include couchdb
}
