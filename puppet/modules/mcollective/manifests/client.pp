class mcollective::client inherits mcollective {
  package { "mcollective-client":
    provider => "yum",
    ensure   => "present",
    require  => Package["mcollective-common"]
  }

  File["/etc/mcollective/client.cfg"] {
    content => template("mcollective/client.cfg.erb")
  }
}
