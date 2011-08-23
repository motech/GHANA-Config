class mcollective::agent inherits mcollective {
  package { "mcollective":
    provider => "yum",
    ensure   => "present",
    require  => Package["mcollective-common"]
  }

  file { "/etc/mcollective/server.cfg":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 640,
    require => Package["mcollective"]
  }

  File["/etc/mcollective/server.cfg"] {
    content => template("mcollective/server.cfg.erb")
  }

  service { "mcollective":
    hasstatus  => true,
    hasrestart => true,
    ensure     => true,
    require    => File["/etc/mcollective/server.cfg"]
  }
}
