$mcollective_server = "sifynode42.thoughtworks.com"

class global {
  $collective = $_collective
}

node base {
  include mcollective::agent
}

node default inherits base {
}

import "dev"
import "qa"
import "ci"
