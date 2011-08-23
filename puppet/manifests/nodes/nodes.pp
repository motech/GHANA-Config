$mcollective_server = "sifynode42.thoughtworks.com"
$collective = "dev"

node base {
  package { 'htop': ensure => installed }
  include mcollective::agent
}

node default inherits base {
}

import "dev"
import "ci"
