class couchdb {
  package { "couchdb":
    ensure  =>  "present",
  }

  service {"couchdb":
      enable  => true,
      ensure  => "running",
      require => Package["couchdb"],
  }
}
