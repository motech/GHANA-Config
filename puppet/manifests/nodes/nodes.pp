$mcollective_server = "sifynode42.thoughtworks.com"

node base {
}

node default inherits base {
}

import "dev"
import "qa"
import "ci"
