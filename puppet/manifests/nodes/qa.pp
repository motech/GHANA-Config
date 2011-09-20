node qa inherits base {
  $_collective = "qa"
  include global
}

node 'sifynode43.thoughtworks.com' inherits qa {
  include tomcat
  include couchdb	
}
