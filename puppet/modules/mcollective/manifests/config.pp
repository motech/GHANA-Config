class mcollective::config inherits mcollective {
  File["/etc/mcollective/server.cfg"] {
    content => template("mcollective/server.cfg.erb")
  }
}
