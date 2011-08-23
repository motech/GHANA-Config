class mcollective::client inherits mcollective {
  package { "mcollective-client":
    provider => "yum",
    ensure   => "present",
    require  => Package["mcollective-common"]]
  }

  file { "/etc/mcollective/client.cfg":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 640,
    require => Package["mcollective-client"]
  }

  File["/etc/mcollective/client.cfg"] {
    content => template("mcollective/client.cfg.erb"),
    require    => [File["/etc/mcollective/client.cfg"]]
  }
}
