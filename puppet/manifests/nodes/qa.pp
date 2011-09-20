node qa inherits base {
  $collective = "qa"
  include mcollective::agent
}

node 'sifynode43.thoughtworks.com' inherits qa {
  include tomcat
  include couchdb	
}
