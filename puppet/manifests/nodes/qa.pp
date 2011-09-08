node qa inherits base {
  $collective = "qa"
}

node 'sifynode43.thoughtworks.com' inherits qa {
  include tomcat
}
