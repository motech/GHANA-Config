$mcollective_server = "sifynode42.thoughtworks.com"
$collective = "dev"

node base {
  include mcollective::agent
}

node default inherits base {
}

import "dev"
import "qa"
import "ci"
