node base {
  package { 'htop': ensure => installed }
  include mcollective::agent
  $collective = "dev"
}

node default inherits base {
}
