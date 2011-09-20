$mcollective_server = "sifynode42.thoughtworks.com"

node base {
  include mcollective::agent
}

import "dev"
import "qa"
import "ci"
